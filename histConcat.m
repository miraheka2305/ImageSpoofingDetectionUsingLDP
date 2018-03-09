function [LDPFeature] = histConcat(mat0,mat45,mat90,mat135,r,option)
		%option = 1-> OverLapping NonUniform(radiusOL)
        %option = 2 -> OverLapping Uniform(radiusUniformOL)
        %option = 3 -> NonOverLapping NonUniform (radiusNOL)
        %option = 4 -> OverLapping Uniform (radiusUniformNOL)
        if (option == 1)
            [hist0] = radiusOL(mat0,r);
            [hist45] = radiusOL(mat45,r);
            [hist90] = radiusOL(mat90,r);
            [hist135] = radiusOL(mat135,r);
        else if (option == 2)
            [hist0] = radiusUniformOL(mat0,r);
            [hist45] = radiusUniformOL(mat45,r);
            [hist90] = radiusUniformOL(mat90,r);
            [hist135] = radiusUniformOL(mat135,r);
        else if (option == 3)
            [hist0] = radiusNOL(mat0,r);
            [hist45] = radiusNOL(mat45,r);
            [hist90] = radiusNOL(mat90,r);
            [hist135] = radiusNOL(mat135,r);
        else if (option == 4)
            [hist0] = radiusUniformNOL(mat0,r);
            [hist45] = radiusUniformNOL(mat45,r);
            [hist90] = radiusUniformNOL(mat90,r);
            [hist135] = radiusUniformNOL(mat135,r);
            end
            end
            end
        end
		LDPFeature = [hist0,hist45,hist90,hist135];
end