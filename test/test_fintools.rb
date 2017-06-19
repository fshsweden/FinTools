require 'test/unit'
require 'fintools'

class TestFintools < Test::Unit::TestCase

  def setup
      #puts "SETUP"
      @price_arr = []
      @price_arr << { :dt => "2017-01-01", :cls => 100.0 }
      @price_arr << { :dt => "2017-01-02", :cls => 101.0 }
      @price_arr << { :dt => "2017-01-03", :cls => 102.0 }
      @price_arr << { :dt => "2017-01-04", :cls => 103.0 }
      @price_arr << { :dt => "2017-01-05", :cls => 104.0 }
      @price_arr << { :dt => "2017-01-06", :cls => 105.0 }
      @price_arr << { :dt => "2017-01-07", :cls => 106.0 }
      @price_arr << { :dt => "2017-01-08", :cls => 107.0 }
      @price_arr << { :dt => "2017-01-09", :cls => 108.0 }
      @price_arr << { :dt => "2017-01-10", :cls => 109.0 }
      @price_arr << { :dt => "2017-01-11", :cls => 110.0 }
      @price_arr << { :dt => "2017-01-12", :cls => 111.0 }
      @price_arr << { :dt => "2017-01-13", :cls => 112.0 }
      @price_arr << { :dt => "2017-01-14", :cls => 113.0 }
      @price_arr << { :dt => "2017-01-15", :cls => 114.0 }
      @price_arr << { :dt => "2017-01-16", :cls => 115.0 }
      @price_arr << { :dt => "2017-01-17", :cls => 116.0 }
      @price_arr << { :dt => "2017-01-18", :cls => 117.0 }
      @price_arr << { :dt => "2017-01-19", :cls => 118.0 }
      @price_arr << { :dt => "2017-01-20", :cls => 119.0 }
      @price_arr << { :dt => "2017-01-21", :cls => 120.0 }
      @price_arr << { :dt => "2017-01-22", :cls => 121.0 }
      @price_arr << { :dt => "2017-01-23", :cls => 122.0 }
      @price_arr << { :dt => "2017-01-24", :cls => 123.0 }
      @price_arr << { :dt => "2017-01-25", :cls => 124.0 }
      @price_arr << { :dt => "2017-01-26", :cls => 125.0 }
      @price_arr << { :dt => "2017-01-27", :cls => 126.0 }
      @price_arr << { :dt => "2017-01-28", :cls => 127.0 }
      @price_arr << { :dt => "2017-01-29", :cls => 128.0 }
      @price_arr << { :dt => "2017-01-30", :cls => 129.0 }
      
      @ft = FinTools.new
  end

  def teardown
      #puts "TEARDOWN"
  end

  def test_sum
    assert_equal @ft.sum([1,2,3,4,5,6]), 21
  end
  
  def test_mean
    assert_equal @ft.mean([2,2,4,4,6,6]), 4
  end

  def test_sample_variance
    assert_equal @ft.sample_variance([1,2,3,4,5,6,7]), 4.666666666666667
  end
  
  def test_standard_deviation
    assert_equal @ft.standard_deviation([1,2,3,4,5,6,7]), 2.160246899469287
  end
  
  def test_histvola
    assert_equal @ft.histvola([1,2,3,4,5,6,7]), 34.42867022313429
  end
  
  def test_sharpe_ratio
    assert_equal @ft.sharpe_ratio([1,2,3,4,5,6,7]), 1.8516401995451028
  end
  
  #
  #
  #
  def test_calc_macd
    
    # [ema26, ema12, ema_diff_9]
    res = @ft.calc_macd(@price_arr, 26, 12, 9)

    #assert_equal [nil,nil,nil,nil,nil,nil,nil,nil,
    #    104.0,105.0,106.0,107.0,108.0,109.0,
    #    110.0,111.0,112.0,113.0,114.0,115.0,
    #    116.0,117.0,118.0,119.0,120.0,121.0,
    #    122.0,123.0,124.0,125.0], res[:ema9]
  end

  def test_calc_ema
      res = @ft.calc_ema([100.0, 101.00, 102.00, 103.00, 99.00, 98.00, 99.00, 101.00, 103.00, 99.00, 100.00, 102.00, 104.00, 105.00], 10)
      assert_equal [nil,nil,nil,nil,nil,nil,nil,nil,nil,
        100.5,100.4090909090909,100.69834710743801,101.29864763335837,101.97162079092958], res
  end

end
