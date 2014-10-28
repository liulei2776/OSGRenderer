startup;
% Initialize the Matlab object.
renderingSizeX = 700; renderingSizeY = 700; % pixels

azimuth = 90; elevation = 45; yaw = 0;
% if you use field of view, set distance to 0
distance = 0; fieldOfView = 25; 


% Setup Renderer
renderer = Renderer();
if ~renderer.initialize({'mesh/Honda-Accord.3ds', 'mesh/road_bike.3ds',...
         'mesh/untitled.dae'},700,700,45,0,0,0,25)
    error('Renderer initilization failed');
end



% If the output is only the rendering, it renders more efficiently
renderer.setModelIndex(1);
renderer.setViewpoint(az,el,yaw,0,fov);
[rendering]= renderer.render();



% Once you initialized the renderer, you can just set 
% the viewpoint and render without loading CAD model again.
renderer.setModelIndex(2);
renderer.setViewpoint(az,el,yaw,0,fov);
[rendering]= renderer.render();



% If you give the second output, it renders depth too.
renderer.setModelIndex(1);
renderer.setViewpoint(0,20,0,0,25);

[rendering, depth]= renderer.render();
subplot(121);imagesc(rendering); axis equal; axis off;
subplot(122);imagesc(1-depth); axis equal; axis off; colormap hot;


% You must clear the memory before you exit
renderer.delete();

