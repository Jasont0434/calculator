require "calculator"

describe Calculator do

  let(:calc){ Calculator.new }

  describe "#add" do
    it "returns an integer" do
      expect(calc.add 1, 1).to be_an Integer
    end

    context "when adding zero to an integer" do
      it "returns the integer" do
        expect(calc.add 4, 0).to eq 4
      end
    end

    it "is not dependent on the operation order" do
      expect(calc.add 1, 2).to eq calc.add(2, 1)
    end

    it "accepts more than 2 arguments" do
      expect(calc.add 2, 4, 3).to eq 9
    end
  end
  
  describe "#sub" do
    it "returns an integer" do
      expect(calc.sub 2, 1).to be_an Integer
    end
    it "is dependent on the operation order" do
      expect(calc.sub 2, 3).not_to eq calc.sub(3, 2)
    end
	context "when subtracting a zero from an integer" do
      it "returns the integer" do
        expect(calc.sub 9, 0).to eq 9
      end 
	end

    context "when subtracting an integer from itself" do
	  it "returns zero" do
	    expect(calc.sub 9,9).to eq 0
	  end
    end
	  it "should except more than two numbers" do
        expect(calc.sub 2, 1, 4).to eq -3
      end
  end
  describe "#multiply" do
    it "returns an integer" do
      expect(calc.multiply 1, 2).to be_an Integer
    end
    
	it "is not dependent on the operation order" do
      expect(calc.multiply 1, 2).to eq calc.multiply(2, 1)
    end
	
	context "when multiplying by one" do
	  it "returns the same integer" do
	    expect(calc.multiply 4,1).to eq 4
	  end
	end
	
    context "when multiplying zero to an integer" do
      it "returns a zero" do
        expect(calc.multiply 4, 0).to eq 0
      end
    end


    it "accepts more than 2 arguments" do
      expect(calc.multiply 2, 4, 3).to eq 24
    end
  end
  
  describe "#division" do
    it "returns an integer" do
      expect(calc.division 2, 1).to be_an Integer
    end
    
	it "is dependent on the operation order" do
      expect(calc.division 2, 3).not_to eq calc.division(3, 2)
    end
	
	context "when dividing by one" do
	  it "returns the same integer" do
	    expect(calc.division 4,1).to eq 4
	  end
	end
	
	context "when dividing zero by an integer" do
      it "returns a zero" do
        expect(calc.division 0, 4).to eq 0
      end
    end
	
	context "when dividing by zero" do
      it "going to cause an error" do
        expect {calc.division 3,0}.to raise_exception      
	  end
    end
	
	it "accepts more than 2 arguments" do
      expect(calc.division 16, 2, 2).to eq 4
    end
  end
end
