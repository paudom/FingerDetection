% - CALCULATION OF NUM OF FINGERS -%
function [Num_fingers] = num_fingers(distance, Option, Thresh1_Limiter,Thresh2_Limiter,Thresh1_dist, Thresh2_dist)
    
    % - CALCULATION OF LOCAL MAX OF THE DISTANCE -%
    if(length(distance)>=2000)
        distance = distance(1:2000);
    end
    Marker = distance-1;
    D_rec = imreconstruct(Marker,distance);
    Dist = distance-D_rec;
    Index_Fingers = find(Dist == max(Dist));
    
    % - FIND DISTANCE VALUE OF MAX INDEX -%
    Value_Fingers = distance(Index_Fingers); 
    
    % - NUM FINGERS DECISION -%
    switch Option
      case 1
          if(max(Value_Fingers)<85)
              Num_fingers = 0;
          else
            Limiter = max(Value_Fingers)*Thresh1_Limiter;
            Value_Fingers(Value_Fingers < Limiter) = 0;
            for i = 1:length(Index_Fingers)-1
                if(Index_Fingers(i)<=10)
                    Value_Fingers(length(Index_Fingers))=0;
                end
                if(abs(Index_Fingers(i+1)-Index_Fingers(i))>length(distance)*Thresh1_dist)
                    Value_Fingers(i+1)=0;
                end
            end
            Fingers = Value_Fingers > 0;
            Num_fingers = sum(Fingers);
            if(Num_fingers>5)
                Num_fingers=5;
            end
          end
      case 2
            Limiter = max(Value_Fingers)*Thresh2_Limiter;
            Value_Fingers(Value_Fingers < Limiter) = 0;
            for i = 1:length(Index_Fingers)-1
                if(Index_Fingers(i)<=10)
                    Value_Fingers(length(Index_Fingers))=0;
                end
                if(abs(Index_Fingers(i+1)-Index_Fingers(i))>length(distance)*Thresh2_dist)
                    Value_Fingers(i+1)=0;
                end
            end
            Fingers = Value_Fingers > 0;
            Num_fingers = sum(Fingers);
            if(Num_fingers>5)
                Num_fingers=5;
            end
    end
end

