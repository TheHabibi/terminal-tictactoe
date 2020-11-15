
def fillArr
    $boardArray = Array.new()
    for i in 1..9
        $boardArray.push(i)
    end

    return $boardArray
end

def drawBoard
    $board = "\n\n"
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
        player.tiles.push(index)
        $round += 1
        
    else
        puts "\n\nThis cell is already filled!\n\n"
    end
        drawBoard
end

def newGame
    $moves = Array.new
    $boardArray = Array.new
    $board = ""
    $round = 0
    
    fillArr
    drawBoard
    game
end    

def game
    playerOne = Player.new("x",1)
    playerTwo = Player.new("o",2)
    
    currentPlayer = playerOne
    
    
    while $round < 9
        puts "Player #{currentPlayer.number} please enter a number:"
        move = gets.chomp().to_i
        
        playerTurn(currentPlayer, move)
        if gameCheck(currentPlayer)
            puts "Player #{currentPlayer.number} WON!!!\n\n"        
            exit
        end
       
        if $round.even?
            currentPlayer = playerOne
        else
            currentPlayer = playerTwo
        end
    end
    puts "TIE!!"
end

def gameCheck(player)
    winCombinations = [
        [1,2,3],[4,5,6],[7,8,9],
        [1,4,7],[2,5,8],[3,6,9],
        [1,5,9],[3,5,7]]

    winCombinations.each do |arr|
        return true if (arr - player.tiles).empty?
    end
       false
end

class Player
    attr_reader :symbol
    attr_reader :number
    attr_accessor :tiles
    def initialize(symbol, number)
        @symbol = symbol
        @number = number
        @tiles = Array.new
    end
end




newGame
