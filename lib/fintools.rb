require 'indicators'

class FinTools

  def sum(arr)
    arr.inject(0) { | accum, i | 
      accum + i
    }
  end

  def mean(arr)
    arr.sum / arr.length.to_f
  end

  def sample_variance(arr)
    m = mean(arr)
    sum = arr.inject(0) { | accum, i |
      accum + (i - m) ** 2
    }
    sum / (arr.length - 1).to_f
  end

  def standard_deviation(arr)
    return Math.sqrt(sample_variance(arr))
  end

  def histvola(values)
    stddev = standard_deviation(values)
    return stddev * Math.sqrt(254)
  end

  # returns is an array of returns(percent)
  def sharpe_ratio(rets)
    return mean(rets) / standard_deviation(rets)
  end

  ####
  def calc_ema(arr, period)
    my_data = Indicators::Data.new(arr)
    return my_data.calc(:type => :ema, :params => period).output
  end

  ####
  def calc_macd(price_arr, ema_long, ema_short, ema_diff)
    closing_prices = price_arr.map { | r |
      r[:cls]
    }
    ema26 = calc_ema(closing_prices, ema_long)
    ema12 = calc_ema(closing_prices, ema_short)

    ema9 = []
    if (ema26.count == ema12.count)
      (0..ema26.count).each do |x|
        if ema26[x] == nil || ema12[x] == nil
          ema9[x] = 0
        else
          ema9[x] = ema26[x] - ema12[x]
        end
      end
    end

    #puts ema26
    #puts ema12
    #puts ema9

    return {:ema26 => ema26, :ema12 => ema12, :ema9 => calc_ema(ema9, 9)}
  end

end
