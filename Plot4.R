make_figure_4 <- function()
{
	png('Plot4.png')
	data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',stringsAsFactors=FALSE)
	data_subset <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
	par(mfrow=c(2,2))
	
	#Generate first plot and apply the axis
	with(data_subset, plot(1:2880, Global_active_power, type='l', xaxt='n', xlab='', ylab = 'Global Active Power'))
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
	
	#Generate second plot and apply the axis
	with(data_subset, plot(1:2880, Voltage, type='l', xaxt = 'n', xlab='datetime', ylab='Voltage'))
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

	#Generate third plot, add additional traces with lines(), then add the axis, then finally the legend.
	plot(1:2880, data_subset$Sub_metering_1, ylab='Energy sub metering', type='l', xaxt='n', xlab='')
	with(data_subset, lines(1:2880, Sub_metering_2, type='l', col='red'))
	with(data_subset, lines(1:2880, Sub_metering_3, type='l', col='blue'))
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
	legend('topright', lty=c(1,1,1), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black','red','blue'), bty='n')

	#Generate 4th plot, then add the axis
	with(data_subset, plot(1:2880, Global_reactive_power, type='l', xaxt='n', xlab = 'datetime'))
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
	
	dev.off()
}