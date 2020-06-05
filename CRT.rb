module CRT
  class CRT

    def initialize(*accessor)
      half = accessor.length / 2
      @bs = accessor.take(half)
      @ms = accessor.drop(half)
      raise "ms must coprime" if @ms.combination(2).any? { |x, y| 1 != x.gcd(y) }
      define_bs
      define_ms
      define_mms
      define_mmis
      @bs.each_with_index do |x, idx|
        send("b#{idx + 1}=".to_sym, x)
      end
      @ms.each_with_index do |x, idx|
        send("m#{idx + 1}=".to_sym, x)
      end
    end

    def m
      @ms.inject(1, :*)
    end

    def define_bs
      @bs.each_with_index do |x, idx|
        self.class.define_method("b#{idx + 1}".to_sym) { @bs[idx] }
        self.class.define_method("b#{idx + 1}=".to_sym) { |n| @bs[idx] = n }
      end
    end

    def define_ms
      @ms.each_with_index do |x, idx|
        self.class.define_method("m#{idx + 1}".to_sym) { @ms[idx] }
        self.class.define_method("m#{idx + 1}=".to_sym) { |n| @ms[idx] = n }
      end
    end

    def define_mms
      @ms.each_with_index do |x, idx|
        self.class.define_method("mm#{idx + 1}".to_sym) do
          m / x
        end
      end
    end

    def define_mmis
      # mmi1 * mm1 = 1(mod m1)
      # 1 = mm1 * x + m1 * y
      # mmi1 = x(mod m1)
      @ms.each_with_index do |x, idx|
        self.class.define_method("mmi#{idx + 1}".to_sym) do
          i = 1
          a, b = send("mm#{idx + 1}".to_sym), x
          c = a % b
          return 1 if c == 1
          until c == 1
            a, b = b, c
            c = a % b
            i *= a / b
          end
          -i % x
        end
      end
    end

    def almost
      0.upto(@bs.length - 1).inject(0) do |rslt, x|
        rslt + send("mmi#{x + 1}".to_sym) * send("mm#{x + 1}".to_sym) * @bs[x]
      end % m
    end

    def result
      "#{almost}(mod #{m})"
    end

  end
end
