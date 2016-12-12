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
    decompressed = []
    index = 0
    until index == sequence.length do
        val = sequence[index]
        if val.match(/\dx\d/)
            i = val[0].to_i
            j = val[2].to_i
            #puts "found #{i} and #{j} from #{val}"
            decompressed.push(sequence[index+1..index+i].join() * j)
        else
            decompressed.push(sequence[index])
        end
        index += 1
    end
    return decompressed
end

sample = ["ADVENT","A(1x5)BC","(3x3)XYZ"]
sample.each do |s|
    x = segment(s)
    puts decomp(x).join()
end


exit

raw_input = IO.binread('input.txt')
lines = raw_input.split("\n")
lines.each do |line|
end
