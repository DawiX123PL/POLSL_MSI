function M = char2mat(A)
    M = sign((A ~= ' ') - .5);
end