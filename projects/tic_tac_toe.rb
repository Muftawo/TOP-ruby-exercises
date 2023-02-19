
class Board
    attr_reader :check , :board

    def initialize
        @check = '_'
        @board = Hash[(1..9).map{ | v | '_'}.each_with_index.map { |v, i|  [i+1, v] }]
    end

    public
    def show_board
        puts
        puts "#{@board[1] } | #{@board[2]} | #{@board[3]}"
        puts "#{@board[4] } | #{@board[5]} | #{@board[6]}"
        puts "#{@board[7] } | #{@board[8]} | #{@board[9]}"
    end
end


class Game
    attr_accessor :players, :player_1, :player_2 , :current_player

    def initialize
        print "Pick your symbol player 1 : "
        player_1 = gets.chomp
        print "Player 2 pick a different symbol : "
        player_2 = gets.chomp

        while player_1 == player_2
            print "Player 2, pick a different symbol from #{player_1} : "
            player_2 = gets.chomp
        end

        @players = {player_1 => "1" , player_2 => "2"}

        @player_1 , @player_2 = player_1, player_2
        puts "player 1: symbol #{@player_1} player 2 symbol #{@player_2}"

        @current_player = @player_2
        @game_board = Board.new
    end

    
    def play_game
        while (not check_win())
            next_move
        end
    end

    private
    def switch_player
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player  = @player_1
        end

        @current_player
    end


    def is_valid_move(position)
        @game_board.board[position] == @game_board.check
    end

    def is_draw
        !@game_board.board.has_value?(@game_board.check)

    end


    def check_win
        board= @game_board.board
        if (board[1] == board[2] and board[1] == board[3] and board[1] != @game_board.check)
            return true
        elsif (board[4] == board[5] and board[4] == board[6] and board[4] != @game_board.check)
            return true
        elsif (board[7] == board[8] and board[7] == board[9] and board[7] != @game_board.check)
            return true
        elsif (board[1] == board[4] and board[1] == board[7] and board[1] != @game_board.check)
            return true
        elsif (board[2] == board[5] and board[2] == board[8] and board[2] != @game_board.check)
            return true
        elsif (board[3] == board[6] and board[3] == board[9] and board[3] != @game_board.check)
            return true
        elsif (board[1] == board[5] and board[1] == board[9] and board[1] != @game_board.check)
            return true
        elsif (board[7] == board[5] and board[7] == board[3] and board[7] != @game_board.check)
            return true
        else
            return false
        end

    end

    def take_postion(position)
        if is_valid_move(position)
            @game_board.board[position]= @current_player

            if is_draw()
                @game_board.show_board
                puts("Drawn Game!")
                exit
            elsif check_win()
                @game_board.show_board

                puts("Player #{@players[@current_player]} wins !")
                exit

            end
        else
            puts("Invalid position")
            print "Player #{@players[@current_player]} please enter a new position between 0-9 : "
            position = gets.chomp
            take_postion(position.to_i)

        end

        end
    end

    def next_move
        @current_player = switch_player()
        @game_board.show_board()
        print("Player #{@players[@current_player] } Enter position between 0-9: ")
        position = gets.chomp
        take_postion(position.to_i)
    end








new_game = Game.new

new_game.play_game
