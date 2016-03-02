def choose_move(game_state):
    """Chooses a move to play given a game state"""
    nim_sum = reduce(lambda x,y: x^y, game_state)
    if nim_sum == 0:
        for i in range(len(game_state)):
            if game_state[i] > 0:
                return (i, game_state[i] - 1)
    else:
        for i in range(len(game_state)):
            tmp = nim_sum ^ game_state[i]
            if tmp < game_state[i]:
                return (i, game_state[i] - tmp)
            
    return (1, 1)
