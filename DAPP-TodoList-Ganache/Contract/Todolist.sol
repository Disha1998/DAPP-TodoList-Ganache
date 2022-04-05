// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract Todolist{

    struct Task{
        string task_name;
        bool is_done;
    }

    mapping(address => Task[]) private Users;
// For add one more  todo in generated List
    function addTask(string calldata _task) external {
    Users[msg.sender].push(Task({
        task_name:_task,
        is_done:false
    }));
    }
    // Getting the task from Blockchain and display in our website (want to show all the data on Frontend)

    function  getTask(uint _taskIndex ) external view returns(Task memory) {
        Task memory task = Users[msg.sender][_taskIndex];
        return task;
    }

    // update the purticular Task (is done or not )
    function updateTaskStatus(uint task_Index, bool _status)external{
        Users[msg.sender][task_Index].is_done = _status;
    }

    // For delete the task

    function deleteTask(uint task_Index)external{
        delete Users[msg.sender][task_Index];
    }

    function getTaskCount() external view returns(uint){
        return Users[msg.sender].length;
    }
}
