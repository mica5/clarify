module Update exposing (update)

import Msg exposing (..)
import Model exposing (..)

findTaskById tasks taskID =
    List.head (List.filter (\task -> task.taskID /= taskID) tasks)

-- update the current state, which we use
-- to decide which view to display.
-- here we will also need to use "msg" to be able to
-- add/delete life goals/priorities/tasks
update msg model =
    case msg of
--        TodayState
--        CreateState
--        -- action states
--        LifeGoalsState
        UpdateCreateLifeGoalRegister in_text -> {
            model |
            new_life_goal_title = in_text,
            debug = toString msg
            }
        CreateLifeGoal -> if model.new_life_goal_title == "" then model else {
            model |
            life_goals = (List.append model.life_goals [LifeGoal model.new_life_goal_title [] model.lifeGoalID]),
            lifeGoalID = model.lifeGoalID + 1,
            new_life_goal_title = "",
            debug = toString msg
            }
        UpdateTaskRegister msgName in_text ->
            case msgName of
                "estimatedMinutes" ->
                    case String.toInt in_text of
                        Err _ -> model
                        Ok estimatedMinutes ->
                            let newTaskRegister=model.newTaskRegister
                            in {model|newTaskRegister={newTaskRegister|estimatedMinutes=estimatedMinutes}}
                "description" ->
                    let newTaskRegister = model.newTaskRegister
                    in {model|newTaskRegister={newTaskRegister|title=in_text}}
--                "lifeGoal" ->
--                    -- in_text to lifeGoalIDInt
--                    case String.toInt in_text of
--                        Err _ -> model
--                        Ok lifeGoalIDInt ->
--                            let
--                                lifeGoals = List.map (
--                                        \lg -> if lg.lifeGoalID /= lifeGoalIDInt then
--                                    ) model.life_goals
--
--
--                                banana = List.length [1,2,3]
--                            in
--                                let newTaskRegister = model.newTaskRegister
--                                in {model|newTaskRegister={newTaskRegister|description=in_text}}
                _ -> model
--        {
--            model |
--            debug = toString msg
--            }
        UpdateTaskEstimatedMinutes taskID estMinutesStr ->
            case String.toInt estMinutesStr of
                Err _ -> model
                Ok estimatedMinutes ->
                    {model |
                        debug = "taskID " ++ (toString taskID) ++ "; estMinutesStr " ++ estMinutesStr
                        , tasks = List.map (\t -> if t.taskID /= taskID then t else {t|estimatedMinutes=estimatedMinutes}) model.tasks
                        }
        -- don't let user create empty task
        CreateTask -> if model.newTaskRegister.title == "" then model else {
            model |
--                title: String
--                , complete: Bool
--                , estimatedMinutes: Int
--                , taskID: Int

            tasks = List.append model.tasks [model.newTaskRegister],
            newTaskRegister = createEmptyTask model.taskID,
            taskID = model.taskID + 1,
            debug = toString msg
            }
        -- TODO if user deletes all life goals, what should we do to the tasks marked as that life goal?
        DeleteLifeGoal id -> {
            model |
            state = msg,
            debug = toString msg,
            life_goals = List.filter (\lifeGoal -> lifeGoal.id /= id) model.life_goals
            }
        _ -> {model | state = msg, debug = toString msg}
-- but this is how we update our model with a new life goal called "cleanliness":
-- { model | life_goals = (LifeGoal "cleanliness" []) :: model.life_goals }
-- we need a "msg" that enumerates the actions we could take at this step,
-- (i.e. create a corresponding version of "type Msg = Increment |
-- Decrement")
