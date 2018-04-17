require './chapter07/gate'
require './chapter07/ticket'

RSpec.describe Gate do
  let(:umeda) { Gate.new(:umeda) }
  let(:juso) { Gate.new(:juso) }
  let(:mikuni) { Gate.new(:mikuni) }

  context '150円の切符を購入して梅田で乗車し、十三で降車した場合' do
    it '出場できる(OK)' do
      ticket = Ticket.new(150)
      umeda.enter(ticket)
      expect(juso.exit(ticket)).to be_truthy
    end
  end

  context '150円の切符を購入して梅田で乗車し、三国で降車した場合' do
    it '出場できない(NG)' do
      ticket = Ticket.new(150)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to be_falsey
    end
  end

  context '190円の切符を購入して梅田で乗車し、三国で降車した場合' do
    it '出場できる(OK)' do
      ticket = Ticket.new(190)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to be_truthy
    end
  end

  context '150円の切符を購入して十三で乗車し、三国で降車した場合' do
    it '出場できる(OK)' do
      ticket = Ticket.new(150)
      juso.enter(ticket)
      expect(mikuni.exit(ticket)).to be_truthy
    end
  end
end
