require './config/environment'
require 'benchmark'

Benchmark.bmbm do |x|

  Post.delete_all
  x.report("exists?") do
    10000.times do
      Post.create(price: rand(1000000))
      Post.where("price < 500000").exists?
    end
  end

  Post.delete_all
  x.report("any?") do
    10000.times do
      Post.create(price: rand(1000000))
      Post.where("price < 500000").any?
    end
  end
end
