set opt(num_udp)            1
set opt(num_tcp)            1
set opt(bottleneck_bw)      10Mb
set opt(bottleneck_latency) 20ms
set opt(bottleneck_qdisc)   SFD
set opt(duration)           100
set opt(simtime)            $opt(duration)
set opt(codel_target)       5ms
set opt(codel_interval)     100ms
set opt(cbr_rate)           10Mb
set opt(iter)               1
set opt(_K)                 0.2
set opt(headroom)           0.05
set opt(cdma_slot_duration) 0.00167
set opt(ensemble_scheduler) pf
set opt(cdma_ewma_slots)    100
set opt(congestion_control) cubic
set opt(link_trace)         link.trace
set opt(tcp)                TCP/Linux
set opt(partialresults) false;    # show partial throughput, delay, and utility scores?
set opt(enable_on_off)  false;    # enable on off traffic iff required.

# LoggingApp specific stuff
set opt(onrand) Exponential
set opt(offrand) Exponential
set opt(onavg) 5.0;               # mean on and off time
set opt(offavg) 5.0;              # mean on and off time
set opt(avgbytes) 16000;          # 16 KBytes flows on avg (too low?)
set opt(ontype) "time";           # valid options are "time" and "bytes"
set opt(app) FTP;

# TCP parameters
#bdp in packets, based on the nominal rtt
set opt(psize) 1500
set opt(nominal_rtt) [ delay_parse 100ms          ]
set bw          [ bw_parse    $opt(bottleneck_bw) ]
set opt(delack) 0.4
set bdp [expr round( $bw *$opt(nominal_rtt)/(8*$opt(psize)))]

Agent/TCP set window_     [expr $bdp * 16]
Agent/TCP set segsize_    [expr $opt(psize)-40]
Agent/TCP set packetSize_ [expr $opt(psize)-40]
Agent/TCP set windowInit_ 4
Agent/TCP set segsperack_ 1
Agent/TCP set timestamps_ true
Agent/TCP set interval_ $opt(delack)
Agent/TCP/FullTcp set window_     [expr $bdp * 16]
Agent/TCP/FullTcp set segsize_    [expr $opt(psize)-40]
Agent/TCP/FullTcp set packetSize_ [expr $opt(psize)40]
Agent/TCP/FullTcp set windowInit_ 4
Agent/TCP/FullTcp set segsperack_ 1
Agent/TCP/FullTcp set timestamps_ true
Agent/TCP/FullTcp set interval_   $opt(delack)
