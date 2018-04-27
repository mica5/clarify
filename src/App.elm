
import Html exposing (
    div, text, Html, a, br, span, hr, button, input, form,
    select, option
    )
import Html.Attributes exposing (href, style, align, id, type_)
import Html.Events exposing (onClick, onSubmit, onInput)

import Model exposing (..)
import Msg exposing (..)
import View exposing (view)
import Update exposing (update)

main = Html.beginnerProgram {
    model=model,
    update=update,
    view=view
    }

-- types:
-- LifeGoal, Priority, Task, Subtask

-- default model
model: Model
--model = Model [] (Today [])
model = Model
    -- life_goals
    [
        LifeGoal "cleanliness" [] 0,
        LifeGoal "education" [] 1
    ]
    -- today: Today
    (Today [])
    -- tasks
    [
        (Task "clean desk" False 0 0),
         Task
             "vacuum room" -- title
             False -- complete
             0 -- estimatedMinutes
             1 -- taskID
    ]
    TodayState -- state
    "" -- debug
    2 -- lifeGoalID
    0 -- taskID
    "" -- new_life_goal_title
    "" -- new_task_title

-- I read https://www.reddit.com/r/elm/comments/4j2fg6/finding_the_last_list_element/d33671d/
-- and then re-wrote it from scratch myself.
last : List a -> Maybe a
last list =
    case list of
        [] -> Nothing
        [last] -> Just last
        h::t -> last t



