trigger acc22 on Contact (after insert){
rollupsum.increment(trigger.new);
}