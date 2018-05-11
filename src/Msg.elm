module Msg exposing (..)

type Msg =
    Noop
    -- simple states
    | TodayState
    | CreateState
    | TaskState
    | HelpState
    | LifeGoalState
    | CompletedState
    -- action states
    | CreateLifeGoal
    | CreateLifeGoalState
    | CreateTaskState
    | CreateTask
    | UpdateCreateLifeGoalRegister String
    | UpdateTaskDescription Int String
    | UpdateTaskEstimatedMinutes Int String
    | UpdateTaskRegister String String
    | UpdateTaskGoal Int String
    | LifeGoalsState
    | UpdateLifeGoalDescription Int String
    | DeleteLifeGoal Int
    | DeleteTask Int
    | CompleteTask Int
    | UncompleteTask Int
    | AddToday Int
    | RemoveToday Int
    | MoveTaskUp Int
    | ToggleSubtaskViewMode
    -- MoveTaskDown thisTaskId newParentTaskId
    | MoveTaskDown Int String
    | UpdateDebug
    | SettingsViewState
    | ToggleSetting String
    | ChangeTaskSorting String
    | FilterTasks String
    | ViewSubTasks Int
    | UpOneLevel
    | TopLevel
    | ToggleUrgency Int
    | ToggleImportance Int
