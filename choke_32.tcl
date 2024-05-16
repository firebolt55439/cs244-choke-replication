set ns [new Simulator]

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
    exec nam out.nam &
    exit 0
}


set tcp1 [$ns node]
set tcp2 [$ns node]
set tcp3 [$ns node]
set tcp4 [$ns node]
set tcp5 [$ns node]
set tcp6 [$ns node]
set tcp7 [$ns node]
set tcp8 [$ns node]
set tcp9 [$ns node]
set tcp10 [$ns node]
set tcp11 [$ns node]
set tcp12 [$ns node]
set tcp13 [$ns node]
set tcp14 [$ns node]
set tcp15 [$ns node]
set tcp16 [$ns node]
set tcp17 [$ns node]
set tcp18 [$ns node]
set tcp19 [$ns node]
set tcp20 [$ns node]
set tcp21 [$ns node]
set tcp22 [$ns node]
set tcp23 [$ns node]
set tcp24 [$ns node]
set tcp25 [$ns node]
set tcp26 [$ns node]
set tcp27 [$ns node]
set tcp28 [$ns node]
set tcp29 [$ns node]
set tcp30 [$ns node]
set tcp31 [$ns node]
set tcp32 [$ns node]

set udp [$ns node]

set router1 [$ns node]
set router2 [$ns node]


set tcp_sink1 [$ns node]
set tcp_sink2 [$ns node]
set tcp_sink3 [$ns node]
set tcp_sink4 [$ns node]
set tcp_sink5 [$ns node]
set tcp_sink6 [$ns node]
set tcp_sink7 [$ns node]
set tcp_sink8 [$ns node]
set tcp_sink9 [$ns node]
set tcp_sink10 [$ns node]
set tcp_sink11 [$ns node]
set tcp_sink12 [$ns node]
set tcp_sink13 [$ns node]
set tcp_sink14 [$ns node]
set tcp_sink15 [$ns node]
set tcp_sink16 [$ns node]
set tcp_sink17 [$ns node]
set tcp_sink18 [$ns node]
set tcp_sink19 [$ns node]
set tcp_sink20 [$ns node]
set tcp_sink21 [$ns node]
set tcp_sink22 [$ns node]
set tcp_sink23 [$ns node]
set tcp_sink24 [$ns node]
set tcp_sink25 [$ns node]
set tcp_sink26 [$ns node]
set tcp_sink27 [$ns node]
set tcp_sink28 [$ns node]
set tcp_sink29 [$ns node]
set tcp_sink30 [$ns node]
set tcp_sink31 [$ns node]
set tcp_sink32 [$ns node]

set udp_sink1 [$ns node]
$ns duplex-link $router1 $router2 1Mb 1ms DropTail

$ns duplex-link $tcp1 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp2 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp3 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp4 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp5 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp6 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp7 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp8 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp9 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp10 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp11 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp12 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp13 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp14 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp15 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp16 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp17 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp18 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp19 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp20 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp21 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp22 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp23 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp24 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp25 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp26 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp27 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp28 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp29 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp30 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp31 $router1 10Mb 1ms DropTail
$ns duplex-link $tcp32 $router1 10Mb 1ms DropTail

$ns duplex-link $udp $router1 10Mb 1ms DropTail

$ns duplex-link $tcp_sink1 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink2 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink3 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink4 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink5 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink6 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink7 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink8 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink9 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink10 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink11 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink12 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink13 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink14 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink15 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink16 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink17 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink18 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink19 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink20 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink21 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink22 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink23 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink24 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink25 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink26 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink27 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink28 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink29 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink30 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink31 $router2 10Mb 1ms DropTail
$ns duplex-link $tcp_sink32 $router2 10Mb 1ms DropTail

$ns duplex-link $udp_sink1 $router2 10Mb 1ms DropTail
$ns queue-limit $router1 $router2 300

set file2 [open queue.tr w]
$ns trace-queue $router1 $router2 $file2

set tcp_ag1 [new Agent/TCP]
$tcp_ag1 set class_ 2
$ns attach-agent $tcp1 $tcp_ag1
set sink1 [new Agent/TCPSink]
$ns attach-agent $tcp_sink1 $sink1
$ns connect $tcp_ag1 $sink1
$tcp_ag1 set fid_ 1

set tcp_ag2 [new Agent/TCP]
$tcp_ag2 set class_ 2
$ns attach-agent $tcp2 $tcp_ag2
set sink2 [new Agent/TCPSink]
$ns attach-agent $tcp_sink2 $sink2
$ns connect $tcp_ag2 $sink2
$tcp_ag2 set fid_ 2

set tcp_ag3 [new Agent/TCP]
$tcp_ag3 set class_ 2
$ns attach-agent $tcp3 $tcp_ag3
set sink3 [new Agent/TCPSink]
$ns attach-agent $tcp_sink3 $sink3
$ns connect $tcp_ag3 $sink3
$tcp_ag3 set fid_ 3

set tcp_ag4 [new Agent/TCP]
$tcp_ag4 set class_ 2
$ns attach-agent $tcp4 $tcp_ag4
set sink4 [new Agent/TCPSink]
$ns attach-agent $tcp_sink4 $sink4
$ns connect $tcp_ag4 $sink4
$tcp_ag4 set fid_ 4

set tcp_ag5 [new Agent/TCP]
$tcp_ag5 set class_ 2
$ns attach-agent $tcp5 $tcp_ag5
set sink5 [new Agent/TCPSink]
$ns attach-agent $tcp_sink5 $sink5
$ns connect $tcp_ag5 $sink5
$tcp_ag5 set fid_ 5

set tcp_ag6 [new Agent/TCP]
$tcp_ag6 set class_ 2
$ns attach-agent $tcp6 $tcp_ag6
set sink6 [new Agent/TCPSink]
$ns attach-agent $tcp_sink6 $sink6
$ns connect $tcp_ag6 $sink6
$tcp_ag6 set fid_ 6

set tcp_ag7 [new Agent/TCP]
$tcp_ag7 set class_ 2
$ns attach-agent $tcp7 $tcp_ag7
set sink7 [new Agent/TCPSink]
$ns attach-agent $tcp_sink7 $sink7
$ns connect $tcp_ag7 $sink7
$tcp_ag7 set fid_ 7

set tcp_ag8 [new Agent/TCP]
$tcp_ag8 set class_ 2
$ns attach-agent $tcp8 $tcp_ag8
set sink8 [new Agent/TCPSink]
$ns attach-agent $tcp_sink8 $sink8
$ns connect $tcp_ag8 $sink8
$tcp_ag8 set fid_ 8

set tcp_ag9 [new Agent/TCP]
$tcp_ag9 set class_ 2
$ns attach-agent $tcp9 $tcp_ag9
set sink9 [new Agent/TCPSink]
$ns attach-agent $tcp_sink9 $sink9
$ns connect $tcp_ag9 $sink9
$tcp_ag9 set fid_ 9

set tcp_ag10 [new Agent/TCP]
$tcp_ag10 set class_ 2
$ns attach-agent $tcp10 $tcp_ag10
set sink10 [new Agent/TCPSink]
$ns attach-agent $tcp_sink10 $sink10
$ns connect $tcp_ag10 $sink10
$tcp_ag10 set fid_ 10

set tcp_ag11 [new Agent/TCP]
$tcp_ag11 set class_ 2
$ns attach-agent $tcp11 $tcp_ag11
set sink11 [new Agent/TCPSink]
$ns attach-agent $tcp_sink11 $sink11
$ns connect $tcp_ag11 $sink11
$tcp_ag11 set fid_ 11

set tcp_ag12 [new Agent/TCP]
$tcp_ag12 set class_ 2
$ns attach-agent $tcp12 $tcp_ag12
set sink12 [new Agent/TCPSink]
$ns attach-agent $tcp_sink12 $sink12
$ns connect $tcp_ag12 $sink12
$tcp_ag12 set fid_ 12

set tcp_ag13 [new Agent/TCP]
$tcp_ag13 set class_ 2
$ns attach-agent $tcp13 $tcp_ag13
set sink13 [new Agent/TCPSink]
$ns attach-agent $tcp_sink13 $sink13
$ns connect $tcp_ag13 $sink13
$tcp_ag13 set fid_ 13

set tcp_ag14 [new Agent/TCP]
$tcp_ag14 set class_ 2
$ns attach-agent $tcp14 $tcp_ag14
set sink14 [new Agent/TCPSink]
$ns attach-agent $tcp_sink14 $sink14
$ns connect $tcp_ag14 $sink14
$tcp_ag14 set fid_ 14

set tcp_ag15 [new Agent/TCP]
$tcp_ag15 set class_ 2
$ns attach-agent $tcp15 $tcp_ag15
set sink15 [new Agent/TCPSink]
$ns attach-agent $tcp_sink15 $sink15
$ns connect $tcp_ag15 $sink15
$tcp_ag15 set fid_ 15

set tcp_ag16 [new Agent/TCP]
$tcp_ag16 set class_ 2
$ns attach-agent $tcp16 $tcp_ag16
set sink16 [new Agent/TCPSink]
$ns attach-agent $tcp_sink16 $sink16
$ns connect $tcp_ag16 $sink16
$tcp_ag16 set fid_ 16

set tcp_ag17 [new Agent/TCP]
$tcp_ag17 set class_ 2
$ns attach-agent $tcp17 $tcp_ag17
set sink17 [new Agent/TCPSink]
$ns attach-agent $tcp_sink17 $sink17
$ns connect $tcp_ag17 $sink17
$tcp_ag17 set fid_ 17

set tcp_ag18 [new Agent/TCP]
$tcp_ag18 set class_ 2
$ns attach-agent $tcp18 $tcp_ag18
set sink18 [new Agent/TCPSink]
$ns attach-agent $tcp_sink18 $sink18
$ns connect $tcp_ag18 $sink18
$tcp_ag18 set fid_ 18

set tcp_ag19 [new Agent/TCP]
$tcp_ag19 set class_ 2
$ns attach-agent $tcp19 $tcp_ag19
set sink19 [new Agent/TCPSink]
$ns attach-agent $tcp_sink19 $sink19
$ns connect $tcp_ag19 $sink19
$tcp_ag19 set fid_ 19

set tcp_ag20 [new Agent/TCP]
$tcp_ag20 set class_ 2
$ns attach-agent $tcp20 $tcp_ag20
set sink20 [new Agent/TCPSink]
$ns attach-agent $tcp_sink20 $sink20
$ns connect $tcp_ag20 $sink20
$tcp_ag20 set fid_ 20

set tcp_ag21 [new Agent/TCP]
$tcp_ag21 set class_ 2
$ns attach-agent $tcp21 $tcp_ag21
set sink21 [new Agent/TCPSink]
$ns attach-agent $tcp_sink21 $sink21
$ns connect $tcp_ag21 $sink21
$tcp_ag21 set fid_ 21

set tcp_ag22 [new Agent/TCP]
$tcp_ag22 set class_ 2
$ns attach-agent $tcp22 $tcp_ag22
set sink22 [new Agent/TCPSink]
$ns attach-agent $tcp_sink22 $sink22
$ns connect $tcp_ag22 $sink22
$tcp_ag22 set fid_ 22

set tcp_ag23 [new Agent/TCP]
$tcp_ag23 set class_ 2
$ns attach-agent $tcp23 $tcp_ag23
set sink23 [new Agent/TCPSink]
$ns attach-agent $tcp_sink23 $sink23
$ns connect $tcp_ag23 $sink23
$tcp_ag23 set fid_ 23

set tcp_ag24 [new Agent/TCP]
$tcp_ag24 set class_ 2
$ns attach-agent $tcp24 $tcp_ag24
set sink24 [new Agent/TCPSink]
$ns attach-agent $tcp_sink24 $sink24
$ns connect $tcp_ag24 $sink24
$tcp_ag24 set fid_ 24

set tcp_ag25 [new Agent/TCP]
$tcp_ag25 set class_ 2
$ns attach-agent $tcp25 $tcp_ag25
set sink25 [new Agent/TCPSink]
$ns attach-agent $tcp_sink25 $sink25
$ns connect $tcp_ag25 $sink25
$tcp_ag25 set fid_ 25

set tcp_ag26 [new Agent/TCP]
$tcp_ag26 set class_ 2
$ns attach-agent $tcp26 $tcp_ag26
set sink26 [new Agent/TCPSink]
$ns attach-agent $tcp_sink26 $sink26
$ns connect $tcp_ag26 $sink26
$tcp_ag26 set fid_ 26

set tcp_ag27 [new Agent/TCP]
$tcp_ag27 set class_ 2
$ns attach-agent $tcp27 $tcp_ag27
set sink27 [new Agent/TCPSink]
$ns attach-agent $tcp_sink27 $sink27
$ns connect $tcp_ag27 $sink27
$tcp_ag27 set fid_ 27

set tcp_ag28 [new Agent/TCP]
$tcp_ag28 set class_ 2
$ns attach-agent $tcp28 $tcp_ag28
set sink28 [new Agent/TCPSink]
$ns attach-agent $tcp_sink28 $sink28
$ns connect $tcp_ag28 $sink28
$tcp_ag28 set fid_ 28

set tcp_ag29 [new Agent/TCP]
$tcp_ag29 set class_ 2
$ns attach-agent $tcp29 $tcp_ag29
set sink29 [new Agent/TCPSink]
$ns attach-agent $tcp_sink29 $sink29
$ns connect $tcp_ag29 $sink29
$tcp_ag29 set fid_ 29

set tcp_ag30 [new Agent/TCP]
$tcp_ag30 set class_ 2
$ns attach-agent $tcp30 $tcp_ag30
set sink30 [new Agent/TCPSink]
$ns attach-agent $tcp_sink30 $sink30
$ns connect $tcp_ag30 $sink30
$tcp_ag30 set fid_ 30

set tcp_ag31 [new Agent/TCP]
$tcp_ag31 set class_ 2
$ns attach-agent $tcp31 $tcp_ag31
set sink31 [new Agent/TCPSink]
$ns attach-agent $tcp_sink31 $sink31
$ns connect $tcp_ag31 $sink31
$tcp_ag31 set fid_ 31

set tcp_ag32 [new Agent/TCP]
$tcp_ag32 set class_ 2
$ns attach-agent $tcp32 $tcp_ag32
set sink32 [new Agent/TCPSink]
$ns attach-agent $tcp_sink32 $sink32
$ns connect $tcp_ag32 $sink32
$tcp_ag32 set fid_ 32

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp_ag1
$ftp1 set type_ FTP

set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp_ag2
$ftp2 set type_ FTP

set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp_ag3
$ftp3 set type_ FTP

set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp_ag4
$ftp4 set type_ FTP

set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp_ag5
$ftp5 set type_ FTP

set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp_ag6
$ftp6 set type_ FTP

set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp_ag7
$ftp7 set type_ FTP

set ftp8 [new Application/FTP]
$ftp8 attach-agent $tcp_ag8
$ftp8 set type_ FTP

set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp_ag9
$ftp9 set type_ FTP

set ftp10 [new Application/FTP]
$ftp10 attach-agent $tcp_ag10
$ftp10 set type_ FTP

set ftp11 [new Application/FTP]
$ftp11 attach-agent $tcp_ag11
$ftp11 set type_ FTP

set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp_ag12
$ftp12 set type_ FTP

set ftp13 [new Application/FTP]
$ftp13 attach-agent $tcp_ag13
$ftp13 set type_ FTP

set ftp14 [new Application/FTP]
$ftp14 attach-agent $tcp_ag14
$ftp14 set type_ FTP

set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp_ag15
$ftp15 set type_ FTP

set ftp16 [new Application/FTP]
$ftp16 attach-agent $tcp_ag16
$ftp16 set type_ FTP

set ftp17 [new Application/FTP]
$ftp17 attach-agent $tcp_ag17
$ftp17 set type_ FTP

set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp_ag18
$ftp18 set type_ FTP

set ftp19 [new Application/FTP]
$ftp19 attach-agent $tcp_ag19
$ftp19 set type_ FTP

set ftp20 [new Application/FTP]
$ftp20 attach-agent $tcp_ag20
$ftp20 set type_ FTP

set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp_ag21
$ftp21 set type_ FTP

set ftp22 [new Application/FTP]
$ftp22 attach-agent $tcp_ag22
$ftp22 set type_ FTP

set ftp23 [new Application/FTP]
$ftp23 attach-agent $tcp_ag23
$ftp23 set type_ FTP

set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp_ag24
$ftp24 set type_ FTP

set ftp25 [new Application/FTP]
$ftp25 attach-agent $tcp_ag25
$ftp25 set type_ FTP

set ftp26 [new Application/FTP]
$ftp26 attach-agent $tcp_ag26
$ftp26 set type_ FTP

set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp_ag27
$ftp27 set type_ FTP

set ftp28 [new Application/FTP]
$ftp28 attach-agent $tcp_ag28
$ftp28 set type_ FTP

set ftp29 [new Application/FTP]
$ftp29 attach-agent $tcp_ag29
$ftp29 set type_ FTP

set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp_ag30
$ftp30 set type_ FTP

set ftp31 [new Application/FTP]
$ftp31 attach-agent $tcp_ag31
$ftp31 set type_ FTP

set ftp32 [new Application/FTP]
$ftp32 attach-agent $tcp_ag32
$ftp32 set type_ FTP

#Setup a UDP connection
set udp_ag [new Agent/UDP]
$ns attach-agent $udp $udp_ag
set null [new Agent/Null]
$ns attach-agent $udp_sink1 $null
$ns connect $udp_ag $null
$udp set fid_ 33

set file1 [open qm.out w]
set qmon [$ns monitor-queue $router1 $router2 $file1 0.1]
[$ns link $router1 $router2] queue-sample-timeout


#Setup a CBR over UDP connection
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp_ag
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 2Mb
$cbr set random_ false

#Schedule events for the CBR and FTP agents
$ns at 0.1 "$cbr start"
$ns at 0.2 "$ftp1 start"
$ns at 118.0 "$ftp1 stop"
$ns at 119.0 "$cbr stop"

#Detach tcp and sink agents (not really necessary)
# $ns at 4.5 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

#Call the finish procedure after 5 seconds of simulation time
$ns at 120.0 "finish"

puts "here"

$ns run
