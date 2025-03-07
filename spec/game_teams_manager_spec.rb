require 'CSV'
require 'spec_helper'
require './lib/stat_tracker'
require './lib/game_teams_manager'


RSpec.describe GameTeamsManager do
  it 'exists' do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)

    expect(game_teams_manager).to be_an_instance_of(GameTeamsManager)
  end

  it 'can create game objects' do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)

    expect(game_teams_manager.game_teams_objects[0]).to be_an(GameTeams)

    expect(game_teams_manager.game_teams_objects.count).to eq(14882)

  end

  it "calculates average goals per game by ID" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.average_goals_per_game_by_id(3)).to eq(2.13)
  end

  it "calculates total goals by team id" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.total_goals_by_team(3)).to eq(1129)
  end

  it "calculates best offense" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.best_offense).to eq("Reign FC")
  end

  it "calculates worst offense" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.worst_offense).to eq("Utah Royals FC")
  end

  it "calculates highest scoring visitor" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.highest_scoring_visitor).to eq("FC Dallas")
  end

  it "calculates highest scoring home team" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.highest_scoring_home_team).to eq("Reign FC")
  end

  it "calculates lowest scoring visitor" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.lowest_scoring_visitor).to eq("San Jose Earthquakes")
  end

  it "calculates lowest scoring home team" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.lowest_scoring_home_team).to eq("Utah Royals FC")
  end

  it "caluculates average win percentage" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.average_win_percentage(3)).to eq(0.43)
  end

  it "calculates most tackles" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.most_tackles("20132014")).to eq("FC Cincinnati")
  end

  it "calculates fewest tackles" do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.fewest_tackles(20132014)).to eq("Atlanta United")
  end

  it '#most_goals_scored' do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.most_goals_scored("18")).to eq(7)
  end

  it '#fewest_goals_scored' do
    game_teams_path = './data/game_teams.csv'
    game_teams_manager = GameTeamsManager.new(game_teams_path)
    expect(game_teams_manager.fewest_goals_scored("18")).to eq(0)
  end
end
