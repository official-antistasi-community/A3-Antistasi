class Tasks {
    class TestTask {
        category = "Test"; // what category the task bellongs to
        func = QFUNC(testTask); // the task information needed to run the task
        params = QFUNC(testTask_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;

        /* Make the task a part of a chain of tasks to only run after other task have been succeded
        class chain {
            name = "TestChain"; // the chain name this task belongs to
            stage = 1; // the stage in the chain this task is available
            lastStage = 1; // if this task should be considered a task end stage (restart chain)
            blockProgress = 1; // stop task from increasing the chain stage
        };
        */
    };

    //Legacy tasks
    class L_AS_Official {
        category = "AS"; // what category the task bellongs to
        func = QFUNC(AS_Official); // the task information needed to run the task
        params = QFUNC(AS_Official_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class L_AS_specOP {
        category = "AS"; // what category the task bellongs to
        func = QFUNC(AS_specOP); // the task information needed to run the task
        params = QFUNC(AS_specOP_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class L_CON_Outpost {
        category = "CON"; // what category the task bellongs to
        func = QFUNC(CON_Outpost); // the task information needed to run the task
        params = QFUNC(CON_Outpost_p); // determines the parameters for a task, if no valid ones can be genereated return false
        version = 1; //version number of task, update when compatibility is broken between last version and new update
        weight = 1;
    };
    class L_LOG_Supplies {
        category = "LOG";
        func = QFUNC(LOG_Supplies);
        params = QFUNC(LOG_Supplies_p);
        version = 1;
        weight = 1;
    };
    class L_LOG_Ammo {
        category = "LOG";
        func = QFUNC(LOG_Ammo);
        params = QFUNC(LOG_Ammo_p);
        version = 1;
        weight = 1;
    };
};
