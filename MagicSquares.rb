#!/usr/bin/env ruby

##
# This program generates magic squares that add up to
# 15 from all directions, using recursion.
#
# Created by: Marlon Poddalgoda
# Version: 1.0
# Since:   2021-05-12
# frozen_string_literal: true


def gen_square(square, index_arr, index)
    # generates a magic square

    count = 0;

    # while loop
    while count < square.length do
        # counter
        if index_arr[count] == 0
            # assign index to array
            square[count] = index
            index_arr[count] = 1

            # check if index < 9
            if index < 9
                # call function
                gen_square(square, index_arr, index + 1)
            elsif is_magic(square) == true
                # call print function
                print_square(square)
            end

            index_arr[count] = 0
        end
        count += 1
    end
end

def is_magic(possible_square)
    # Check if possible square is a magic square, adding to 15

    # magic variable
    magic_num = 15

    # program adds up every row, colum and diagonal
    row_1 = possible_square[0] + possible_square[1] + possible_square[2]
    row_2 = possible_square[3] + possible_square[4] + possible_square[5]
    row_3 = possible_square[6] + possible_square[7] + possible_square[8]
    col_1 = possible_square[0] + possible_square[3] + possible_square[6]
    col_2 = possible_square[1] + possible_square[4] + possible_square[7]
    col_3 = possible_square[2] + possible_square[5] + possible_square[8]
    diag_1 = possible_square[0] + possible_square[4] + possible_square[8]
    diag_2 = possible_square[2] + possible_square[4] + possible_square[6]

    # Check if all values add to 15
    if row_1 == magic_num && row_2 == magic_num &&
        row_3 == magic_num && col_1 == magic_num &&
         col_2 == magic_num && col_3 == magic_num &&
         diag_1 == magic_num && diag_2 == magic_num

        # return
        return true
    else
        # return
        return false
    end
end

def print_square(output_square)
    # prints the inputted array in a magic square format

    # variables
    count = 0

    puts "*****"
    while count < output_square.length do
        if count == 3 || count == 6
            puts
            print "#{output_square[count]} "
        else
            print "#{output_square[count]} "
        end
        count += 1
    end
    puts
    puts "*****"
end


puts "All possible Magic Squares (3x3):"
puts

magic_square = Array[1, 2, 3, 4, 5, 6, 7, 8, 9]
index_arr = Array[0, 0, 0, 0, 0, 0, 0, 0, 0]

# call function
gen_square(magic_square, index_arr, 1)

puts
puts "Done."
