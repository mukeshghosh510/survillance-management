

videoIdx = 1; 

obj = mmreader(['testing_videos\',sprintf('%.2d',videoIdx),'.avi']);
numFrames = get(obj, 'NumberOfFrames');
load(['testing_label_mask\',num2str(videoIdx),'_label']);

 

for ii = 1 : numFrames
    mask = volLabel{ii};
    curFrame = im2double(read(obj, ii));
    curFrame(:,:,1) = min(curFrame(:,:,1) +  0.5*double(mask), 1); 
    imshow(curFrame);
    getframe;
end
