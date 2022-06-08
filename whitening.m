function answear= whitening(packet)
    g = [1, 1, 1, 1, 1, 1, 1, 1]
    for bit = 1:length(packet)
        t = g(7)
        g(7) = g(6)
        g(6) = g(5)
        g(5) = xor(g(4), t)
        g(4) = g(3)
        g(2) = g(1)
        g(1) = t
        answear(bit) = xor(t, packet(bit))
    end
end