require 'CharlesSchwab'
require 'pp'

include CharlesSchwab

namespace :charles_schwab do
  desc "Import Transaction History from Charles Schwab Plan"
  task load_transactions: :environment do
  	transactions = CharlesSchwab::ETL::TransactionsCSV.new('/home/tite/Documents/Personal/Investments/401/transaction_history.csv')
	pp transactions
	transactions.each do |row|
		pp "row"
	end
  end

end

