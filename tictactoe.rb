
def fillArr
    $boardArray = Array.new()
    for i in 1..9
        $boardArray.push(i)
    end

    return $boardArray
end

def drawBoard
    $board = ""
    for m in 0..8
        $board << "| #{$boardArray[m]} |"
        if (m+1) % 3 == 0 && m <8
            $board << "\n---------------\n"
        end
    end
    $board << "\n\n"
    
    puts $board
end

def playerTurn(player, index)
    
    if $moves.include?(index) != true
        $moves.push(index)
        $boardArray[index-1] = player.symbol
        drawBoard
    else
        puts "You can't put your symbol here!\n\n"
    end

    
    
end

def game
    playerOne = Player.new("x")
    playerTwo = Player.new("o")
    
    move = nil
    round = 0
    while round < 9
        puts "Player #{round%2+1} please start"
        move = gets.chomp().to_i
        if move.odd?
            playerTurn(playerOne, move)
        else
            playerTurn(playerTwo, move)
        end
        round += 1
    end
end


class Player
    attr_reader :symbol
    def initialize(symbol)
        @symbol = symbol
    end
end

$moves = Array.new
$boardArray = Array.new
$board = ""
fillArr
drawBoard
game


