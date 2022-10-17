class PrizesController < ApplicationController
  def index
    @prizes = Prize.all.order(:order)
  end

  def choose_or_reject
    @prize = Prize.find(params[:id])
  end

  def choose
    @prize = Prize.find(params[:id])
    @prize.update!(
      chosen: true,
      revealed: true,
    )

    redirect_to prizes_path
  end

  def reject
    @prize = Prize.find(params[:id])
    @prize.update!(
      rejected: true,
      revealed: true,
    )

    redirect_to prizes_path
  end

  def reveal
    Prize.all.each do |prize|
      prize.update!(revealed: true)
    end

    redirect_to prizes_path
  end
end
