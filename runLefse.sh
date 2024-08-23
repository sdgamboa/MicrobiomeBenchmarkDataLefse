## Script for running lefse

lefse_format_input.py gingivalplaque.txt gingivalplaque.in -c 1 -s 2 -u 3 -o 1000000 
## -c which row use for class labels (conditions)
## -s Which row use for subclass labels (cofounder)
## -u which row use for subject labels (samples)

i=1
while [ $i -le 10 ]
do
    bp=$(( 30 + ($i * 10 )))
    echo Running iteration $i with bootstrap $bp...
    lefse_run.py -a 0.05 -w 0.05 -l 2 -b $bp gingivalplaque.in gingivalplaque\_it"$i"\_bp"$bp".res
    i=$(( $i + 1 ))
done
