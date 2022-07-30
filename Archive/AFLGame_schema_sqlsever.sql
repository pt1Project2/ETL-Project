-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/cc01V5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [game] (
    [game_id] varchar(12)  NOT NULL ,
    [year] int  NOT NULL ,
    [round] varchar(3)  NOT NULL ,
    [date] date  NOT NULL ,
    [start_time] time  NOT NULL ,
    [stadium_id] int  NOT NULL ,
    [attendance] int  NOT NULL ,
    [home_team_id] int  NULL ,
    [home_team_score] int  NOT NULL ,
    [away_team_id] int  NULL ,
    [away_team_score] int  NOT NULL ,
    [rain_fall] dec  NOT NULL 
)

CREATE TABLE [game_player_status] (
    [game_id] varchar(12)  NOT NULL ,
    [team_id] int  NOT NULL ,
    [player_id] int  NOT NULL ,
    [rebounds] int  NOT NULL ,
    [inside_50s] int  NOT NULL ,
    [clearances] int  NOT NULL ,
    [contested_possessions] int  NOT NULL 
)

CREATE TABLE [player] (
    [player_id] int  NOT NULL ,
    [first_name] varchar(20)  NOT NULL ,
    [last_name] varchar(20)  NOT NULL 
)

CREATE TABLE [stadium] (
    [stadium_id] serial  NOT NULL ,
    [name] varchar(50)  NOT NULL ,
    [city_id] int  NULL ,
    [start_year] int  NOT NULL ,
    [end_year] int  NOT NULL ,
    [capacity] int  NOT NULL ,
    [active_ind] boolean  NOT NULL 
)

CREATE TABLE [city] (
    [city_id] serial  NOT NULL ,
    [name] varchar(50)  NOT NULL ,
    [state] varchar(3)  NOT NULL 
)

CREATE TABLE [team] (
    [team_id] seiral  NOT NULL ,
    [name] varchar(50)  NOT NULL ,
    [stadium_id] int  NOT NULL 
)

ALTER TABLE [game] WITH CHECK ADD CONSTRAINT [FK_game_stadium_id] FOREIGN KEY([stadium_id])
REFERENCES [stadium] ([stadium_id])

ALTER TABLE [game] CHECK CONSTRAINT [FK_game_stadium_id]

ALTER TABLE [game] WITH CHECK ADD CONSTRAINT [FK_game_home_team_id] FOREIGN KEY([home_team_id])
REFERENCES [team] ([team_id])

ALTER TABLE [game] CHECK CONSTRAINT [FK_game_home_team_id]

ALTER TABLE [game] WITH CHECK ADD CONSTRAINT [FK_game_away_team_id] FOREIGN KEY([away_team_id])
REFERENCES [team] ([team_id])

ALTER TABLE [game] CHECK CONSTRAINT [FK_game_away_team_id]

ALTER TABLE [game_player_status] WITH CHECK ADD CONSTRAINT [FK_game_player_status_game_id] FOREIGN KEY([game_id])
REFERENCES [game] ([game_id])

ALTER TABLE [game_player_status] CHECK CONSTRAINT [FK_game_player_status_game_id]

ALTER TABLE [game_player_status] WITH CHECK ADD CONSTRAINT [FK_game_player_status_team_id] FOREIGN KEY([team_id])
REFERENCES [team] ([team_id])

ALTER TABLE [game_player_status] CHECK CONSTRAINT [FK_game_player_status_team_id]

ALTER TABLE [game_player_status] WITH CHECK ADD CONSTRAINT [FK_game_player_status_player_id] FOREIGN KEY([player_id])
REFERENCES [player] ([player_id])

ALTER TABLE [game_player_status] CHECK CONSTRAINT [FK_game_player_status_player_id]

ALTER TABLE [stadium] WITH CHECK ADD CONSTRAINT [FK_stadium_city_id] FOREIGN KEY([city_id])
REFERENCES [city] ([city_id])

ALTER TABLE [stadium] CHECK CONSTRAINT [FK_stadium_city_id]

ALTER TABLE [team] WITH CHECK ADD CONSTRAINT [FK_team_stadium_id] FOREIGN KEY([stadium_id])
REFERENCES [stadium] ([stadium_id])

ALTER TABLE [team] CHECK CONSTRAINT [FK_team_stadium_id]

COMMIT TRANSACTION QUICKDBD