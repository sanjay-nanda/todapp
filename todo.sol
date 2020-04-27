pragma solidity ^0.5.11;

contract Todapp{
    
    uint public index = 0;
    
    struct Task{
        string title;
        uint number;
        bool isOver;
    }
    
    mapping(uint => Task) Tasks;
    
    event Create(
        uint id,
        string title
        );
    
    event Completed(
        uint id,
        string title
        );
        
    function AddTask(string calldata _title, uint  _number) external {
        index++;
        Tasks[index] = Task(_title, _number, false);
        emit Create(_number, _title);
    }
    
    function TaskComplete(uint _id) external{
        Task memory task = Tasks[_id];
        task.isOver = true;
        Tasks[_id] = task;
        emit Completed(_id, task.title);
    }
    
    
}