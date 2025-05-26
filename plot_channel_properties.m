function  plot_channel_properties(t1, chProb_m, t2, chProb_h, t3, chProb_n, grayColor, min_x, max_x, min_y, max_y, my_fontsize,...
    my_lineWidth, ylabel_name, panel_loc, panelName, legendName, plotName, x_label_flag, xlabel_name, legend_flag)

    figure();
    plot(t1, chProb_m, 'Color', 'm' , 'LineWidth', my_lineWidth)
    hold on
    plot(t2, chProb_h ,'Color', grayColor , 'LineWidth', my_lineWidth)
    hold on
    plot(t3, chProb_n ,'Color', 'g' , 'LineWidth', my_lineWidth)
    axis([min_x max_x min_y max_y])
    set(gca,'visible','on')
    set(gca,'FontSize', my_fontsize, 'FontName', 'Times New Roman', 'LineWidth', my_lineWidth) 
    set(gca,'xtick',[])
    ylabel(ylabel_name, 'FontSize', my_fontsize);
    text(panel_loc(1), panel_loc(2), panelName, 'fontsize', my_fontsize,'FontName','Helvetica')

   
    if ~x_label_flag
        set(gca,'xtick',[])
    else
        xlabel(xlabel_name,'FontSize',22)
    end
    if legend_flag
       lgd = legend(legendName , 'Orientation','horizontal', 'Location' , 'northoutside');
        lgd.FontSize = my_fontsize;
        legend boxoff
    end
    box off
    exportgraphics(gcf, char([plotName,'.png']) );

end