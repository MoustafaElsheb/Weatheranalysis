%the project is done in cell format 
load data.mat
%importing the mean,extmin and extmax columns of the data
mean=data(:,8);
extmin=data(:,12);
extmax=data(:,10);
%ploting the three first graph in the same figure
    subplot(1,3,1)
    plot(mean)
    xlabel('Months from the beginning of data')
    ylabel('Mean tempreature')
    title('Mean tempreature Vs. Time')
    
    subplot(1,3,2)
    plot(extmin)
    xlabel('Months from the beginning of data')
    ylabel('Extreme minimum tempreature')
    title('Extreme minimum tempreature Vs. Time')
    
    subplot(1,3,3)
    plot(extmax)
    xlabel('Months from the beginning of data')
    ylabel('Extreme maximum tempreature')
    title('Extreme maximum tempreature Vs. Time')
 %Importing all the months for the mean,minimumtempreatures and maximum
 %tempreatures. We are also importing all the years related to the months 
for n=1:12
    x=find(data(:,3)==n)
    cell{n,:}=x
    meanmonth{:,n}={data(cell{n,:},8)}
    extminmonth{:,n}={data(cell{n,:},12)}
    extmaxmonth{:,n}={data(cell{n,:},10)}
    years{:,n}={data(cell{n,:},2)}
end
%how to divide the above into 12 seperate series?
%how to differntiate between a cell and another because I can only use
%cell{n,:}?
%saving the 6 parameters that are asked(min,max,mean,standard,mode and
%mean), we are doing this for all month of january to december of the whole
%data. Note that the cell format is used 
for n=1:12
    %1st set for the mean
meanmonthmin(n,:)=nanmin(meanmonth{1,n}{1,1})
meanmonthmax(n,:)=nanmax(meanmonth{1,n}{1,1})
meanmonthmean(n,:)=nanmean(meanmonth{1,n}{1,1})
meanmonthmean(n,:)=nanmedian(meanmonth{1,n}{1,1})
meanmonthstd(n,:)=nanstd(meanmonth{1,n}{1,1})
meanmonthmode(n,:)=mode(meanmonth{1,n}{1,1})
%2nd set for the extreme minimum parameters
extminmonthmin(n,:)=nanmin(extminmonth{1,n}{1,1})
extminmonthmax(n,:)=nanmax(extminmonth{1,n}{1,1})
extminmonthmean(n,:)=nanmean(extminmonth{1,n}{1,1})
extminmonthmean(n,:)=nanmedian(extminmonth{1,n}{1,1})
extminmonthstd(n,:)=nanstd(extminmonth{1,n}{1,1})
extminmonthmode(n,:)=mode(extminmonth{1,n}{1,1})
%3rd set for the extreme maximum tempreature
extmaxmonthmin(n,:)=nanmin(extmaxmonth{1,n}{1,1})
extmaxmonthmax(n,:)=nanmax(extmaxmonth{1,n}{1,1})
extmaxmonthmean(n,:)=nanmean(extmaxmonth{1,n}{1,1})
extmaxmonthmedian(n,:)=nanmedian(extmaxmonth{1,n}{1,1})
extmaxmonthstd(n,:)=nanstd(extmaxmonth{1,n}{1,1})
extmaxmonthmode(n,:)=mode(extmaxmonth{1,n}{1,1})
end
% plotting the mean tempreatures of all months of the data
for n=1:12
coefs(n,:)=polyfit(years,(meanmonth{1,n}{1,1}),1) %getting the coefficents of the data for a quadtratic of degree 1
curve=polyval(coefs,years) % getting the best linear fit 
subplot(3,3,n) % subplot is used to plot all the means of 12 months throughout the time interval of the data
plot(years,(meanmonth{1,n}{1,1}),'o',years,curve) %plotting the data along with the best linear fit
xlabel('Years');
ylabel('Mean Tempreature')
title(fprintf('Month %d',n)) %looping for the month(from 1 to 12) of the data
end
%plotting the extreme minmum tempreatures of all the months of the data
for n=1:12
  subplot(3,3,n)
  coefs(n,:)=polyfit(years,(extminmonth{1,n}{1,1}),1) %don't forget to remove thr nans
curve=polyval(coefs,years)
subplot(3,3,n)
plot(years,(extminmonth{1,n}{1,1}),'o',years,curve)
xlabel('Years');
ylabel('Extreme minimum tempreature')
title(fprintf('Month %d',n))
end
%plotting the exteme maximum data for all the months of the data
for n=1:12
  subplot(3,3,n)
  coefs(n,:)=polyfit(years,(extminmonth{1,n}{1,1}),1) %don't forget to remove thr nans
curve=polyval(coefs,years)
subplot(3,3,n)
plot(years,(extminmonth{1,n}{1,1}),'o',years,curve)
xlabel('Years');
ylabel('Extreme minimum tempreature')
title(fprintf('Month %d',n)) 
  


