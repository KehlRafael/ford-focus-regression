function printLinearRegression(training_data, theta_history, X, plottitle, x_label, y_label,imgfile)
    h = figure('visible','off');
    axis tight manual % this ensures that getframe() returns a consistent size
    % Will always do 50 frames from the whole process
    bar = waitbar(1, "GIF animation being created, please wait...");
    max = size(theta_history,2);
    step = max/50;
    for n = 1:step:max
        waitbar(n/size(theta_history,2), bar, "GIF animation being created, please wait...");
        % Draw plot 
        scatter(training_data(:,1),training_data(:,2),'DisplayName','Training data')
        hold on
        plot(X(:,2),X*theta_history(:,n),'-',"linewidth", 1.5,'DisplayName','Model')
        hold off
        title({plottitle; ["Iteration: " num2str(n)]});
        xlabel(x_label);
        ylabel(y_label);
        legend
        drawnow 
        % Capture the plot as an image 
        frame = getframe(h); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im); 
        % Write to the GIF File 
        if n == 1 
            imwrite(imind,cm,imgfile,'gif', 'Loopcount',inf,'DelayTime',0.2); 
        elseif n >= max - step
            imwrite(imind,cm,imgfile,'gif','WriteMode','append','DelayTime',2); 
        else
            imwrite(imind,cm,imgfile,'gif','WriteMode','append','DelayTime',0.2); 
        end
    end
    close(h);
    close(bar);
end