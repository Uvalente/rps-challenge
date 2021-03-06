feature 'shows result' do
  before { log_in }

  scenario 'player choose rock and wins vs scissor' do
    choose(option: 'rock')
    allow(RpsGame::MOVES).to receive(:sample) { 'scissor' }
    click_button 'Play!'
    expect(page).to have_content 'Umberto wins!'
  end

  scenario 'player choose rock and draws vs rock' do
    choose(option: 'rock')
    allow(RpsGame::MOVES).to receive(:sample) { 'rock' }
    click_button 'Play!'
    expect(page).to have_content 'No winners, you draw!'
  end

  scenario 'player choose rock and loses vs paper' do
    choose(option: 'rock')
    allow(RpsGame::MOVES).to receive(:sample) { 'paper' }
    click_button 'Play!'
    expect(page).to have_content 'Computer wins!'
  end

  scenario 'player choose paper and wins vs rock' do
    choose(option: 'paper')
    allow(RpsGame::MOVES).to receive(:sample) { 'rock' }
    click_button 'Play!'
    expect(page).to have_content 'Umberto wins!'
  end

  scenario 'player choose paper and draws vs paper' do
    choose(option: 'paper')
    allow(RpsGame::MOVES).to receive(:sample) { 'paper' }
    click_button 'Play!'
    expect(page).to have_content 'No winners, you draw!'
  end

  scenario 'player choose paper and loses vs scissor' do
    choose(option: 'paper')
    allow(RpsGame::MOVES).to receive(:sample) { 'scissor' }
    click_button 'Play!'
    expect(page).to have_content 'Computer wins!'
  end

  scenario 'player choose scissor and wins vs paper' do
    choose(option: 'scissor')
    allow(RpsGame::MOVES).to receive(:sample) { 'paper' }
    click_button 'Play!'
    expect(page).to have_content 'Umberto wins!'
  end

  scenario 'player choose scissor and draws vs scissor' do
    choose(option: 'scissor')
    allow(RpsGame::MOVES).to receive(:sample) { 'scissor' }
    click_button 'Play!'
    expect(page).to have_content 'No winners, you draw!'
  end

  scenario 'player choose scissor and loses vs rock' do
    choose(option: 'scissor')
    allow(RpsGame::MOVES).to receive(:sample) { 'rock' }
    click_button 'Play!'
    expect(page).to have_content 'Computer wins!'
  end
end

feature 'play again' do
  scenario 'after a game you can choose to play again' do
    log_in
    choose(option: 'rock')
    click_button 'Play'
    click_button 'Play again'
    expect(page).to have_content 'Choose your move'
  end
end
