
function Fx = policyRL(states)
% states: [x; theta; dx; dtheta]，单位(rad)
% 输出 Fx: 力(N)

tic
global agent
Fx = getAction(agent, double(states(:)));
Fx = double(Fx);
toc

end
