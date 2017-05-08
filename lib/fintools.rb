class FinTools
    def sum(arr)
      arr.inject(0){|accum, i| accum + i }
    end

    def mean(arr)
      arr.sum/arr.length.to_f
    end

    def sample_variance(arr)
      m = mean(arr)
      sum = arr.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(arr.length - 1).to_f
    end

    def standard_deviation(arr)
      return Math.sqrt(sample_variance(arr))
    end

  	def histvola(values)
  	    stddev = standard_deviation(values)
        return stddev * Math.sqrt(254)
  	end

    # returns is an array of returns (percent)
  	def sharpe_ratio(rets)
        return mean(rets) / standard_deviation(rets)
  	end
end
