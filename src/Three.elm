module Three exposing (..)

import Array
import Parser exposing (..)


maze =
    "..##.......\n#...#...#..\n.#....#..#.\n..#.#...#.#\n.#...##..#.\n..#.##.....\n.#.#.#....#\n.#........#\n#.##...#...\n#...##....#\n.#..#...#.#"


big_maze =
    "...........#..............##...\n...#....................#......\n.....####...........#.#..#.#...\n....##.#.......................\n.......#.##......#.###.........\n.#.....#.......##.......#.....#\n...........##....##.#....#.....\n......#.........#....#.........\n..###....#.........#....#.#....\n....#....#.#..#..#.........#.#.\n..........................#...#\n.##...........#...#.#.......#..\n#....##...#.#....#.............\n....#..##......##..#.#....#....\n#..........#.............#..#.#\n...#.####.....#..#.#.#..#...#..\n..........#......#........#..#.\n............#.....#..#..#....#.\n.................#...#.........\n..#...#...................#....\n..............##...#...........\n..........................#..#.\n#...#...#............#...#.....\n.................#..##.......#.\n............#....#.............\n.#......#.#...#....#...#.......\n.....#.....##..##.....#.......#\n.#..#..##...............#..#...\n#...#...##............#........\n.......#....#.......#..........\n...............................\n#................#...#.........\n...#...#..#..#.............##.#\n......#........#..............#\n...#.....##.#...#...#..........\n.........#..#........##.#...##.\n#.........##..#.......#........\n........##.#.#.................\n.#....#............###....#....\n...#.##....#.....##..#..#....#.\n....#..#........##..#...#..##..\n..........#............#.......\n.........#........##....#..##..\n#....#.........#.#.......#..#..\n...#....#......##.#............\n........#..#...............#...\n..............#.....#........#.\n......#..#.#........#..#..#.##.\n..#........###....#.#..........\n...#..#...#.#....##..#........#\n........#..#..............#....\n#.####.................#....##.\n.#................#............\n....#....#....#................\n#......#........##....#...#....\n......#..##..#..###...#.#.#....\n.#..........##.................\n...#...#....#...#.....#.....#..\n............#......##.........#\n..............##...............\n##....#....#...#...#....#..###.\n...................#.......##..\n#.....##........#....#.........\n...#.......#...........#.......\n...............##..............\n##.......#......#.....#........\n#....#..#..##..#.......#..#..#.\n.....#.............#.......#...\n......#..#........#.......#.#..\n..#...#...........#.##.........\n..#................####.#..#...\n......##....#.........#........\n..#..#.......#...##....#......#\n#.#..........#..............#.#\n.#.#..............#.##...#.....\n................#.....#.#......\n##.........#.........#.....#...\n....#.#.....................#..\n..#..#..#........#.......#.....\n.....#..#.#....#....#.....#....\n..####....#.#.........#........\n#..##...##..#.#............#..#\n.#........#..##.#.....#......##\n.##.##.....##....#.#...........\n....#..#.#..##............#.#..\n........#.#...#....#.........#.\n.....#.#.#.....#....#.....##...\n#...#..#....##..#..............\n..#...#....#...##..#.......#...\n.#....##.......................\n.........#............##.#..#..\n....#................#...#.#...\n...................#..#...#....\n#..#...................#.......\n..##..............#..........##\n...#.##......#.............#...\n.........#.#.........#.........\n...###......#.................#\n..........#....##..............\n.##..#....#.........#.#........\n.........#.......#.......#.#...\n#........#............#......#.\n....................#..........\n.......#...##..........#...#...\n....#.#.......#.#...##..#.#....\n...#..........#..............#.\n........##..............#......\n......#...##......#....##......\n....#.....#.#.##..............#\n...#...........#.#.............\n...........#......#.#..........\n...#.#......#......#...#...#...\n..#.......................#....\n...#...#..#..................#.\n##.....#.....#..#..#.....#...#.\n.#..#.......##.#.#.............\n......##.......##............#.\n.......#..#..#.......#....#.#..\n......#.....##..##...#........#\n.....#........#.##..........#..\n#....##............#........#..\n.....#..#...#............#...#.\n##.#....#........#.............\n.##...............##......#.#..\n###..#..#.......#.#..........#.\n.....#...........#...##........\n..#.#.#.........#.....#....#...\n.....#....##.......#..#.#......\n......#.....#...#..#...##..#...\n.....#....#................#...\n......#....#.#...##......##.#.#\n.....###.............#.........\n.................#......#####..\n.#.......#..........#.#....##..\n..#..#.......#.....#..#......##\n..........#.#.##.......##....#.\n##...#...##.##......#..###.....\n..#..#..#......#....#..........\n..#...#....#......#....#....#.#\n.#...#........#.....#......#..#\n#.........#......#.##.##.......\n#.##..#.............#.....#....\n....#.......#..#..##...##......\n...#.............#.#......#....\n#.....#..........##...##.....#.\n...............#........#....#.\n#.....#...#..#.............##..\n.#....##.#.......#.#..........#\n....#....#.#.....#....#......#.\n......#......#.................\n.#.#..#.#.#...#...#..#.##.#..##\n.............#.....#...........\n............#...#..#..#.....#..\n.#..........#.......#....#.....\n......#..###.#...#.............\n......#..........#.............\n....#.................#..#.#.#.\n...##.##.#....##.##............\n####......#........###......#..\n..#.......#.#..#.##............\n.....#.....#.#.......#.....#...\n.....#..........#.#............\n#.....#.............#......##..\n......##..........##....#......\n.#..............#..........#...\n......#..#...#........#..#....#\n.#......#.......#..#...........\n..#..#....#.#.......#....##..#.\n........#.#................#...\n#.......#.##.#......#...#.....#\n..#...#.#.....##...............\n..........#.....##.............\n.......#............#........#.\n...#............#......#......#\n.#..#.......#...#...#..#..#....\n#....#.#...#......#...#......#.\n.#.......#..#.#...........#....\n...##.#...#.......#..........#.\n.....#..............#..#...#...\n...........................#...\n.............#.....#...........\n....#.#..#..#...#..#...........\n.....#.#.#..#.#....#.#.#.......\n.......#..............#.....##.\n........#..#..#.#..#...#.#.....\n.....#.#...#.#.#.....#..#...#..\n.....#....#.......#......#.#...\n.#.#...........#........#......\n.##..##......#......#......#.#.\n.....#.###.#.......##.#..#.....\n#.......##..#.........#....#...\n.#.............#.........#.#.#.\n..........#..#..#....#....#....\n#....#...........##..#.....#..#\n......#....#...###..#...#......\n.....#....#........#....#..#...\n...##..............#.##...#....\n.#............#........##......\n..##........#.#...........#...#\n..#.#...##...#..#..........##..\n.................#.......#.....\n......#.....#............#.....\n.#.....#.........#.#..#.#......\n.............#.#.#..#.......#.#\n#......#.....#..##...#.......#.\n.......#.#..#...#.........#....\n...#..##...#.........#.#....#..\n........................#..#...\n....##..##................#....\n.......#..#.......#........##..\n.....#....#.##....#............\n.#....#............#.....#...#.\n..##.....#......#......#.#....#\n...#...........#...##....#.....\n......#.##.#..##...##.#.#..##..\n.......##....#......#....#.#...\n.....####..#............#..##..\n......##..##..##.........#...#.\n.#.#...............#.........#.\n......#......#...........#.....\n.....#.......##.....#..#.......\n.....##..#..#....#.#.......#...\n...........###.###.##..#.#..#..\n.#...............##.........#..\n......##..........#..#.....##.#\n.............#....#....#..##...\n.#..............#........#.....\n.#..#.........................#\n.##..............#..........#..\n..#..#.#.#.#......#............\n....#...#.#.#....#........#..#.\n.....#........#....#.....#.....\n.#...#.#......#..#........#.##.\n.......#.....#................#\n.#.#........................#..\n............#..#.......#.......\n....##.#........#...#.#.#.#.#..\n.....#.......##................\n...##...#....#.....#.#.........\n#...#..............#.......#...\n...#.#.#.#..##....##...........\n.....##...#....#.....#.........\n#......#.....#....#............\n....#..###....#.##.......#...#.\n..................##.#......#..\n.....##..............##.#....#.\n.........#...#........#..#....#\n.##..#.........#....#..##...#..\n#.#.##................#.##.....\n..#.#....#.#.......#....#......\n..#.#.##.#.......#.............\n..#....#.#..##.#..........#.#..\n#.....#.....#.....#.........#..\n#.......##.....#....##.....#...\n..#...#.........##.#..##.......\n..#.#.........#.......#........\n#.....#.....##.#.#..#...#..#.##\n.........................#.##..\n..#.#..#..#..#........#......#.\n..#..............#.............\n.....#.......##.##.....#.......\n....#...#...............#..#...\n....#......#.#........##.#..#.#\n....................#..#.......\n.....#.......#......#.##.......\n#.......##..........#.....#....\n.#.......#....#.#......#.......\n......#...#...............#.##.\n....##.#.....#.............#.##\n#..#................##...#.....\n....###......#.#.........#..#..\n...#...#......#...##....#...#.#\n..#...#.#.##.#.................\n.....##......#..#.#....#.......\n##.......#......#.#..#.#.......\n.#.#.#.........#...#.#..#......\n#...#.#........#....#.#.....#..\n....#.......##....#......##....\n.....#..........#......#....#..\n#...#....#...#.....#.#.........\n...#..##.....##....#.....#.#...\n..................#.....##.....\n.....#............#............\n...#.....#..#........#.#..##...\n.......#.#.....................\n......#...#.......#..#...#..#..\n.#..#...#.....##.....#.#.#....#\n....##...#.#............#..#..#\n...........#............#..#...\n.......#.....#................#\n..#......#.#.......#.#.........\n.....#..#.#.##.................\n.....#..#......................\n...#....#...#..#.#..#....#.....\n.#............#.....#..........\n#.##..#..#.......#......#.....#\n.#.........#....#....#.........\n...#.#.#........#.#....#...#...\n#........#..#..#..........#..#.\n.....#..#.....##......##..##.#.\n..............#.......#..#..#..\n....#........#.##.#...#........\n..#.#..#....#........##.....##.\n...##.....#...#.......#.#....#.\n#.....#..##.##.#...##.......#..\n.....#........#.#.#....#.......\n.#................#####..#.#...\n..........##..#..###....#......\n.....#.......#..........#..#...\n..#....#....................#..\n#.....#..#.....#...##.#.....#.#\n...#..##............#.....#....\n##.#..#.......##...............\n........##...#.#.....#......#..\n........#...#..................\n#......#................#.#....\n...........#...#..#.........#..\n...#.##..#.##..................\n.....#......###......#..#......\n..#.#.....#...#..#.##........#.\n....#..........#.#.....#.......\n..#..........#..........#.#....\n..#.##.......#......#..........\n"



-- too lazy to do this one


cols =
    31



-- 11


treeCounter right down the_maze =
    List.foldl
        (\s b ->
            if s == "#" then
                b + 1

            else
                b + 0
        )
        0
        (List.map
            (\x ->
                ( down * x
                , remainderBy cols (right * x)
                )
            )
            (List.range 1 (String.filter (\n -> n == '\n') the_maze |> String.length))
            |> List.map (\( y, x ) -> Array.foldl (\s b -> String.slice x (x + 1) s) "" (Array.slice y (y + 1) (Array.fromList (String.split "\n" the_maze))))
        )


slopes =
    [ ( 1, 1 ), ( 3, 1 ), ( 5, 1 ), ( 7, 1 ), ( 1, 2 ) ]


answer32 =
    List.foldl (\( r, d ) product -> product * treeCounter r d big_maze) 1 slopes