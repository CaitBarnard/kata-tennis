class Tennis

    def initialize
        @score1 = '0'
        @score2 = '0'
    end

    def check_score1
        set_duece
        @score1
    end

    def check_score2
        set_duece
        @score2
    end

    def set_duece
        if @score1 == '40' && @score2 == '40'
            @score1 = 'duece'
            @score2 = 'duece'
        end
    end

    def add_point(player)
        player == 1 ? score = @score1 : score = @score2

        case score
        when '0'
            score = '15'
        when '15'
            score = '30'
        when '30'
            score = '40'
        end

        player == 1 ? @score1 = score : @score2 = score
    end

end


describe Tennis do

    it "test scores are both 0" do
        tennis = Tennis.new
        expect(tennis.check_score1).to eq('0')
        expect(tennis.check_score2).to eq('0')
    end

    it "test both scores are 15" do
        tennis = Tennis.new
        tennis.add_point(1)
        tennis.add_point(2)
        expect(tennis.check_score1).to eq('15')
        expect(tennis.check_score2).to eq('15')
    end

    it "test one score is 15, other is 0" do
        tennis = Tennis.new
        tennis.add_point(1)
        expect(tennis.check_score1).to eq('15')
        expect(tennis.check_score2).to eq('0')
    end

    it "test player1 score is 30" do
        tennis = Tennis.new
        2.times {tennis.add_point(1)}
        expect(tennis.check_score1).to eq('30')
    end

    it "test player1 score is 40" do
        tennis = Tennis.new
        3.times {tennis.add_point(1)}
        expect(tennis.check_score1).to eq('40')
    end

    it "test both scores are 40 and therefore deuce" do
        tennis = Tennis.new
        3.times {tennis.add_point(1)}
        3.times {tennis.add_point(2)}
        expect(tennis.check_score1).to eq('duece')
        expect(tennis.check_score2).to eq('duece')
    end
 
    xit "test player has adv after duece" do
        tennis = Tennis.new
        4.times {tennis.add_point(1)}
        3.times {tennis.add_point(2)}
        expect(tennis.check_score1).to eq('adv')
        expect(tennis.check_score2).to eq('40')
    end

end