%% 实验5高级语言代码
clear
clc
sum=0;
flag=1; %flag=1表示是质数
k=0;
a=[];
for i=2:1103
    for j=2:i-1
        k=i;
        while(k>0)
            k=k-j;
        end
        if(k==0) % 能被整除说明不是质数
            flag=0;
        end
    end
    if(flag==1)
        sum=sum+i;
        a=[a;i];
    end
    flag=1;
end
fprintf('质数和为%.f\n',sum);
