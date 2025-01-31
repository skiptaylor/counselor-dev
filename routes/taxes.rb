get('/tax/:zip/?') do
  if params[:zip].length == 5
    Tax.rate(params[:zip]).to_s
  else
    '0'
  end
end