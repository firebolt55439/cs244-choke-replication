import sys

NUM_NODES = 32
# QUEUE_ALGORITHM = "DropTail"
# QUEUE_ALGORITHM = "RED"
# QUEUE_ALGORITHM = "CHOKe"
QUEUE_ALGORITHM = sys.argv[2]

MIN_TH = 25
MAX_TH = 50

UDP_ARRIVAL_RATE = f"{sys.argv[1]}Kb"

simulation = """set ns [new Simulator]

Queue/CHOKe set mean_pktsize_ 1000

$ns color 1 Blue
$ns color 2 Red

set nf [open out.nam w]
$ns namtrace-all $nf

set tf [open out.tr w]
$ns trace-all $tf


proc finish {} {
    global ns nf tf file1 file2
    $ns flush-trace
    close $nf
    close $tf
    close $file1
    close $file2
    exit 0
}


"""

simulation += f"""
Queue/CHOKe set thresh_ {MIN_TH}
Queue/CHOKe set thresh_queue_ {MIN_TH}
Queue/CHOKe set maxthresh_ {MAX_TH}
Queue/CHOKe set maxthresh_queue_ {MAX_TH}

Queue/RED set bytes_ false
Queue/RED set queue_in_bytes_ false
Queue/RED set thresh_ {MIN_TH}
Queue/RED set thresh_queue_ {MIN_TH}
Queue/RED set maxthresh_ {MAX_TH}
Queue/RED set maxthresh_queue_ {MAX_TH}
"""

for i in range(1, NUM_NODES + 1):
    simulation += f"set tcp{i} [$ns node]\n"

simulation += """
set udp [$ns node]

set router1 [$ns node]
set router2 [$ns node]\n\n
"""

for i in range(1, NUM_NODES + 1):
    simulation += f"set tcp_sink{i} [$ns node]\n"

simulation += f"""\nset udp_sink1 [$ns node]
$ns duplex-link $router1 $router2 1Mb 1ms {QUEUE_ALGORITHM}\n
"""

for i in range(1, NUM_NODES + 1):
    simulation += f"$ns duplex-link $tcp{i} $router1 10Mb 1ms {QUEUE_ALGORITHM}\n"

simulation += f"""\n$ns duplex-link $udp $router1 10Mb 1ms {QUEUE_ALGORITHM}\n\n"""

for i in range(1, NUM_NODES + 1):
    simulation += f"$ns duplex-link $tcp_sink{i} $router2 10Mb 1ms {QUEUE_ALGORITHM}\n"

simulation += f"""\n$ns duplex-link $udp_sink1 $router2 10Mb 1ms {QUEUE_ALGORITHM}
$ns queue-limit $router1 $router2 300

set file2 [open queue.tr w]
$ns trace-queue $router1 $router2 $file2\n\n"""

for i in range(1, NUM_NODES + 1):
    simulation += f"""set tcp_ag{i} [new Agent/TCP]
$tcp_ag{i} set class_ 2
$tcp_ag{i} set window_ 300
$tcp_ag{i} set packetSize_ 1000
$ns attach-agent $tcp{i} $tcp_ag{i}
set sink{i} [new Agent/TCPSink]
$ns attach-agent $tcp_sink{i} $sink{i}
$ns connect $tcp_ag{i} $sink{i}
$tcp_ag{i} set fid_ {i}\n\n"""

for i in range(1, NUM_NODES + 1):
    simulation += f"""set ftp{i} [new Application/FTP]
$ftp{i} attach-agent $tcp_ag{i}
$ftp{i} set type_ FTP\n\n"""

simulation += f"""#Setup a UDP connection
set udp_ag [new Agent/UDP]
$ns attach-agent $udp $udp_ag
set null [new Agent/Null]
$ns attach-agent $udp_sink1 $null
$ns connect $udp_ag $null
$udp_ag set fid_ 33

set file1 [open qm.out w]
set qmon [$ns monitor-queue $router1 $router2 $file1 0.1]
[$ns link $router1 $router2] queue-sample-timeout\n

#Setup a CBR over UDP connection
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp_ag
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ {UDP_ARRIVAL_RATE}
$cbr set random_ false\n\n"""

simulation += """#Schedule events for the CBR and FTP agents
$ns at 0.0 "$cbr start"
"""

for i in range(1, NUM_NODES + 1):
    simulation += f"""$ns at 0.0 "$ftp{i} start"\n"""
    simulation += f"""$ns at 120.0 "$ftp{i} stop"\n"""


simulation += """
$ns at 120.0 "$cbr stop"

#Detach tcp and sink agents (not really necessary)
# $ns at 4.5 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

#Call the finish procedure after 5 seconds of simulation time
$ns at 120.0 "finish"

puts "here"

$ns run\n"""


with open(f"choke_{NUM_NODES}.tcl", "w") as f:
    f.write(simulation)

print(
    f"Generated choke_{NUM_NODES}.tcl with {NUM_NODES} nodes and arrival rate of {UDP_ARRIVAL_RATE}"
)
