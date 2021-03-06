#!/usr/bin/env ruby

require 'io/console'

def segment(sequence)
    segments = []
    count = 0
    index = 0
    sequenceArray = sequence.split('')
    until index == sequenceArray.length do
        if sequenceArray[index] == '('
            section = sequenceArray[index+1..index+3].join()
            segments.push(section)
            index += 5
        else
            segments.push(sequenceArray[index])
            index += 1
        end
    end
    return segments
end

def decomp(sequence)
    pattern = /\dx\d/
    decompressed = []
    index = 0
    until index == sequence.length do
        val = sequence[index]
        if val.match(pattern)
            enumerator  = val[0]
            charCount = val[2]
            sub = sequence[index+1..index+enumerator.to_i]
            puts "enumerator: #{enumerator} charCount: #{charCount} sub: #{sub}"
            if sub.all? {|s| s.match(pattern)}
                puts "RECURSE"
            end
            decompressed.push(sub.join() * charCount.to_i)
        else
            decompressed.push(sequence[index])
        end
        index += 1
    end
    return decompressed
end

#sample = ["ADVENT","A(1x5)BC","(3x3)XYZ", "(6x1)(1x3)A", "X(8x2)(3x3)ABCY"]
sample = ["(6x1)(1x3)A"]
sample.each do |s|
    x = segment(s)
    out = decomp(x).join()
    c = out.length
    puts "#{out} is #{c}"
end


exit

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")
lines.each do |line|
end
