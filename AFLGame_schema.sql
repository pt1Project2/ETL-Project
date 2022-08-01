-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "game" (
    "game_id" varchar(12)   NOT NULL,
    "year" int   NULL,
    "round" varchar(3)   NULL,
    "date" date   NULL,
    "start_time" time   NULL,
    "stadium_id" int   NULL,
    "attendance" int   NULL,
    "home_team_id" int   NULL,
    "home_team_score" int   NULL,
    "away_team_id" int   NULL,
    "away_team_score" int   NULL,
    "rain_fall" dec   NULL
);

CREATE TABLE "game_player_status" (
    "game_id" varchar(12)   NOT NULL,
    "year" int   NOT NULL,
    "team_id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "rebounds" int   NULL,
    "inside_50s" int   NULL,
    "clearances" int   NULL,
    "contested_possessions" int   NULL
);

CREATE TABLE "player" (
    "player_id" int   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL
);

CREATE TABLE "stadium" (
    "stadium_id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "city_id" int   NULL,
    "start_year" int   NULL,
    "end_year" int   NULL,
    "capacity" int   NULL,
    "active_ind" boolean   NULL
);

CREATE TABLE "city" (
    "city_id" serial   NOT NULL,
    "name" varchar(50)   NULL,
    "state" varchar(50)   NULL
);

CREATE TABLE "team" (
    "team_id" serial   NOT NULL,
    "name" varchar(50)   NULL,
    "stadiums" varchar(50)   NULL
);

CREATE TABLE "tvs" (
    "tvs_id" serial   NOT NULL,
    "year" int   NOT NULL,
    "team_id" int   NULL,
    "tvs" int   NOT NULL
);

ALTER TABLE "game" ADD CONSTRAINT "fk_game_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "stadium" ("stadium_id");

ALTER TABLE "game" ADD CONSTRAINT "fk_game_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "game" ADD CONSTRAINT "fk_game_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "game_player_status" ADD CONSTRAINT "fk_game_player_status_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");

ALTER TABLE "game_player_status" ADD CONSTRAINT "fk_game_player_status_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "game_player_status" ADD CONSTRAINT "fk_game_player_status_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "stadium" ADD CONSTRAINT "fk_stadium_city_id" FOREIGN KEY("city_id")
REFERENCES "city" ("city_id");

ALTER TABLE "tvs" ADD CONSTRAINT "fk_tvs_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

