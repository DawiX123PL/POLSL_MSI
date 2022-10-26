function A = wzorce2mat(wzorce)

    A = [];

    for w = wzorce
        A1 = reshape(w{:,:}, [], 1);
        A = [A, A1];
    end

end