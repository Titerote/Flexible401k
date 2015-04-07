require 'csv'
require 'date'

module CharlesSchwab
  module ETL
    CASH = ['Cash Receipts'] unless defined? CASH
      
    class TransactionsCSV < CSV 
      include Enumerable
      Trx = Struct.new(:date,:type) do
        def <=> (itm2)
          rval = self.date <=> itm2.date 
          return -1 if rval == 0 and ETL::CASH.include? self.type
          return 1 if rval == 0 and ETL::CASH.include? itm2.type
          return rval
        end
      end
      
      def initialize(filename)
        super(filename)
        @transactions = Hash.new
#        rval = self.read(filename)
#        puts "TransactionsCSV",rval
        # Make sure to read all the file, use date to index it in a hash, and come up with one transaction 
        #   per day and type (purchase / sale).
        CSV.foreach(filename) do |row|
          #We are using Date and Activity (transaction type) as index for the collection of entries
          begin
#            tmp_date = row[0].to_date
            tmp_date = Date.strptime(row[0], '%m/%d/%Y %I:%M:%S %p').to_date
#            pp "date is #{tmp_date} "
            @transactions[Trx.new(tmp_date,row[4])] = Array.new unless @transactions[Trx.new(tmp_date,row[4])]
            # Date.strptime(row[0], '%m/%d/%Y %I:%M:%S %p')
            trx = {date: tmp_date, fund_name: row[1], account: row[2], sub_type: row[3], type: row[4], 
              price: row[5].to_f, units: row[6].to_f, amount: row[7].to_f }
            @transactions[Trx.new(tmp_date,row[4])] << trx
          rescue Exception => e
            pp row[0], e, e.backtrace
          end
        end
        # Once the collection is loaded we sort it by date and type (sort will put the cash reciepts first)
        @transactions.keys.sort.each { |k| @transactions[k] = @transactions.delete k }
      end 
      
      def each
        #Here, iterate for the array of Transaction objects, and return.
        @transactions.each() do |key,trx|
          pp "Looping on type #{key[1]} with size: #{trx.size} at #{key[0]} "
          if ETL::CASH.include? key[1] then
            pp "Cash Contribution! #{trx} "
            rval = Contribution.new trx
          else 
            trx.each do |trx_data|
              pp "DATA: #{trx_data}"
            end
            yield trx
          end
        end
      end
    end
  end
end