class Complexnum 
    attr_accessor :real,:imag,:adding,:multiply
    @@adding=0
    @@multiply=0
    def initialize(real,imag)
        @real=real
        @imag=imag
    end

    def +(comp)
        real_adding=self.real+comp.real
        imag_adding=self.imag+comp.imag
        puts "the real adding =#{real_adding}"
        puts "the imag adding =#{imag_adding}"
        @@adding+=1
        add_res=Complexnum.new(real_adding,imag_adding)

    end

    def *(comp)
        real_multi=self.real*comp.real
        imag_multi=self.imag*comp.imag
        puts "the real multiple =#{real_multi}"
        puts "the imag multiple =#{imag_multi}"
        @@multiply+=1
        multi_res=Complexnum.new(real_multi,imag_multi)
    end

    def self.bulk_add(arrcomp)
        sum_real=0
        sum_imag=0
        sum=Complexnum.new(sum_real,sum_imag)
        arrcomp.each do|c| 
            sum+=c
        end
        puts "sum real=#{sum.real}"
        puts "sum imag=#{sum.imag}"
        sum
    end
    def self.bulk_multiply(arrcomp)
        multi_real=1
        multi_imag=1
        multi=Complexnum.new(multi_real,multi_imag)
        arrcomp.each {|m| multi*=m}
        puts "multiple real=#{multi.real}"
        puts "multiple imag=#{multi.imag}"
        multi
    end

    def self.get_stats
        puts "The adding used #{@@adding} times"
        puts "The multipling used #{@@multiply} times"
    end


end

comp1=Complexnum.new(2,6)
comp2=Complexnum.new(3,5)
comp1+comp2
comp1*comp2
comp3=Complexnum.new(3,7)
comp4=Complexnum.new(3,7)

arr=[comp1,comp2,comp3,comp4]
Complexnum.bulk_add(arr)
Complexnum.bulk_multiply(arr)
Complexnum.get_stats
