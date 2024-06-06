import os
import numpy as np
from collections import defaultdict
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns


def parse_queue_file(queue_file):
    queue_size = defaultdict(int)
    queue_totals = defaultdict(np.int64)
    queue_nums = defaultdict(np.int64)
    queue_enqueues = defaultdict(np.int64)
    queue_drops = defaultdict(np.int64)

    all_pkt_ids = defaultdict(set)
    dropped_pkt_ids = defaultdict(set)

    SAMPLE_INTERVAL = 0.1000
    next_sample = SAMPLE_INTERVAL

    with open(queue_file, "r") as fp:
        for line in fp:
            (
                event,
                time,
                from_node,
                to_node,
                pkt_type,
                pkt_size,
                flags,
                flow_id,
                src_addr,
                dst_addr,
                seq_num,
                pkt_id,
            ) = line.split()

            all_pkt_ids[pkt_type].add(pkt_id)

            if event == "+":
                queue_size[pkt_type] += 1
            elif event in ("-", "d"):
                queue_size[pkt_type] -= 1

            if event == "d":
                queue_drops[pkt_type] += 1
                dropped_pkt_ids[pkt_type].add(pkt_id)

            if event == "+":
                queue_enqueues[pkt_type] += 1
            # if event in ("-", "d"):

            time = float(time)
            if time >= next_sample:
                next_sample += SAMPLE_INTERVAL
                for key in queue_size:
                    queue_nums[key] += 1
                    queue_totals[key] += queue_size[key]

            # if pkt_type == "cbr":
            #     print(f"UDP packet @ t={time}")
            # elif pkt_type == "tcp":
            #     print(f"TCP packet @ t={time}")

    queue_means = {}
    for pkt_type in queue_totals:
        queue_means[pkt_type] = np.float64(queue_totals[pkt_type]) / np.float64(
            queue_nums[pkt_type]
        )

    print(f"Number of UDP time samples: {(queue_nums['cbr'])}")
    print(f"Number of TCP time samples: {(queue_nums['tcp'])}")

    print(
        f"UDP drop rate: {(np.float64(len(dropped_pkt_ids['cbr'])) / np.float64(len(all_pkt_ids['cbr']))):%}"
    )
    print(
        f"TCP drop rate: {(np.float64(len(dropped_pkt_ids['tcp'])) / np.float64(len(all_pkt_ids['tcp']))):%}"
    )

    print(
        f"Total number of non-dropped UDP packets: {(len(all_pkt_ids['cbr']) - len(dropped_pkt_ids['cbr']))}"
    )
    print(
        f"Total number of non-dropped TCP packets: {(len(all_pkt_ids['tcp']) - len(dropped_pkt_ids['tcp']))}"
    )

    print(f"Average UDP queue occupancy: {(queue_means['cbr'])}")
    print(f"Average TCP queue occupancy: {(queue_means['tcp'])}")
    print(
        f"Average total queue occupancy: {(queue_means['cbr'] + (queue_means['tcp']))}"
    )

    return {
        "avg_tcp": queue_means["tcp"],
        "avg_udp": queue_means["cbr"],
        "avg_total": queue_means["cbr"] + queue_means["tcp"],
    }


samples = np.logspace(2, 4, num=20)
# samples = np.array([10**4])
# samples = np.logspace(2, 5, num=25)
print(samples)
outputs = []
for rate in samples:
    print("\n\n")
    print(f"Testing arrival rate: {np.int32(np.round(rate))}Kbps")
    os.system(f"python gen.py {rate}")
    os.system("rm *.out *.tr *.nam *.log 2>&1 > /dev/null 2>&1")
    os.system("../ns choke_32.tcl > /dev/null")

    occupancies = parse_queue_file("queue.tr")
    outputs.append({"rate": rate, **occupancies})

df = pd.DataFrame(outputs)

# make seaborn plot look professional / academic, like a paper
sns.set_theme(style="whitegrid")

# nicer color scheme
sns.set_palette("inferno", n_colors=3)

# increase font size
sns.set(font_scale=1.5)

# increase figure size
plt.figure(figsize=(8, 6))

# plot all 3 lines in same plot
sns.lineplot(x="rate", y="avg_tcp", data=df, markers=True, label="TCP Queue Occupancy")
sns.lineplot(x="rate", y="avg_udp", data=df, markers=True, label="UDP Queue Occupancy")
sns.lineplot(
    x="rate", y="avg_total", data=df, markers=True, label="Total Queue Occupancy"
)
# add legend with custom labels
plt.legend()

# plot title and axis labels
plt.title("Queue Occupancy vs. UDP Arrival Rate Under CHOKe")
plt.title("Queue Occupancy vs. UDP Arrival Rate Under RED")
plt.xlabel("UDP Arrival Rate (Kbps)")
plt.ylabel("Queue Occupancy (packets)")
# save figure please
plt.xscale("log")
plt.savefig("sweep.png")
plt.show()
