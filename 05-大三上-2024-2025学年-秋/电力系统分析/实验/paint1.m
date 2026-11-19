function paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,start1,end1)
    start1=start1*600;end1=end1*600;
    num1=[start1:1:end1];

    figure('Color', [1, 1, 1]);
    figure(1);
    hold on;
    plot(num1,ua(start1:end1));plot(num1,ub(start1:end1));plot(num1,uc(start1:end1));
    hold off;
    title("发电机高压侧相电压");
    xlabel("采样点");
    ylabel("电压/V");
    max1=max([max(ua(start1:end1)) max(ub(start1:end1)) max(uc(start1:end1))]);
    min1=min([min(ua(start1:end1)) min(ub(start1:end1)) min(uc(start1:end1))]);
    ylim([-inf,max1+(max1-min1)*0.4]);
    legend("A相","B相","C相");

    figure('Color', [1, 1, 1]);
    figure(2);
    hold on;
    plot(num1,ia(start1:end1));plot(num1,ib(start1:end1));plot(num1,ic(start1:end1));
    hold off;
    title("发电机低压侧相电流");
    xlabel("采样点");
    ylabel("电流/A");
    max1=max([max(ia(start1:end1)) max(ib(start1:end1)) max(ic(start1:end1))]);
    min1=min([min(ia(start1:end1)) min(ib(start1:end1)) min(ic(start1:end1))]);
    ylim([-inf,max1+(max1-min1)*0.4]);
    legend("A相","B相","C相");

    figure('Color', [1, 1, 1]);
    figure(3);
    hold on;
    plot(num1,pa(start1:end1));plot(num1,pb(start1:end1));plot(num1,pc(start1:end1));
    hold off;
    title("发电机低压侧有功功率");
    xlabel("采样点");
    ylabel("有功功率/kW");
    max1=max([max(pa(start1:end1)) max(pb(start1:end1)) max(pc(start1:end1))]);
    min1=min([min(pa(start1:end1)) min(pb(start1:end1)) min(pc(start1:end1))]);
    ylim([-inf,max1+(max1-min1)*0.4]);
    legend("A相","B相","C相");

    figure('Color', [1, 1, 1]);
    figure(4);
    hold on;
    plot(num1,qa(start1:end1));plot(num1,qb(start1:end1));plot(num1,qc(start1:end1));
    hold off;
    title("发电机低压侧无功功率");
    xlabel("采样点");
    ylabel("无功功率/kvar");
    max1=max([max(qa(start1:end1)) max(qb(start1:end1)) max(qc(start1:end1))]);
    min1=min([min(qa(start1:end1)) min(qb(start1:end1)) min(qc(start1:end1))]);
    ylim([-inf,max1+(max1-min1)*0.4]);
    legend("A相","B相","C相");

    figure('Color', [1, 1, 1]);
    figure(5);
    hold on;
    plot(num1,F(start1:end1));
    hold off;
    title("发电机高压侧频率");
    xlabel("采样点");
    ylabel("频率/Hz");
end