% Author : Siddhesh Dilip Rane
% UID : 116147286
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    %-------------- Handles -------------%
    [returnCode,joint1]=vrep.simxGetObjectHandle(clientID,'joint1',vrep.simx_opmode_blocking);
    [returnCode,joint2]=vrep.simxGetObjectHandle(clientID,'joint2',vrep.simx_opmode_blocking);
    [returnCode,joint3]=vrep.simxGetObjectHandle(clientID,'joint3',vrep.simx_opmode_blocking);
    [returnCode,joint4]=vrep.simxGetObjectHandle(clientID,'joint4',vrep.simx_opmode_blocking);
    [returnCode,joint5]=vrep.simxGetObjectHandle(clientID,'joint5',vrep.simx_opmode_blocking);
    [returnCode,joint6]=vrep.simxGetObjectHandle(clientID,'joint6',vrep.simx_opmode_blocking);
    
    % Current positions
    [returnCode,j1_init]=vrep.simxGetJointPosition(clientID,joint1,vrep.simx_opmode_streaming);
    [returnCode,j2_init]=vrep.simxGetJointPosition(clientID,joint2,vrep.simx_opmode_streaming);
    [returnCode,j3_init]=vrep.simxGetJointPosition(clientID,joint3,vrep.simx_opmode_streaming);
    [returnCode,j4_init]=vrep.simxGetJointPosition(clientID,joint4,vrep.simx_opmode_streaming);
    [returnCode,j5_init]=vrep.simxGetJointPosition(clientID,joint5,vrep.simx_opmode_streaming);
    [returnCode,j6_init]=vrep.simxGetJointPosition(clientID,joint6,vrep.simx_opmode_streaming);
    % Test 1: Check Forward Kinematics for Pos 0
    [returnCode]=vrep.simxSetJointPosition(clientID,joint1,degtorad(0),vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointPosition(clientID,joint2,degtorad(0),vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointPosition(clientID,joint3,degtorad(0),vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointPosition(clientID,joint4,degtorad(0),vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointPosition(clientID,joint5,degtorad(0),vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointPosition(clientID,joint6,degtorad(0),vrep.simx_opmode_blocking);
    
    [returnCode,pos0]=vrep.simxGetObjectPosition(clientID,joint5,-1,vrep.simx_opmode_blocking);
    disp(pos0);
    vrep.simxFinish(-1);
end 
vrep.delete();