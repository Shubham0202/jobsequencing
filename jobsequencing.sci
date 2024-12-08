
function jobSeq = createJobStruct(job_id, deadline, profit)
    jobSeq.id = job_id;
    jobSeq.deadline = deadline;
    jobSeq.profit = profit;
endfunction


function jobSequence(jobs, n)
    
    for i = 1:n-1
        for j = 1:n-i
            if jobs(j).profit < jobs(j+1).profit then
                temp = jobs(j);
                jobs(j) = jobs(j+1);
                jobs(j+1) = temp;
            end
        end
    end
    

    scheduledJobs = -ones(1, n); // -1 means the slot is empty
    totalProfit = 0; // To keep track of total profit
    
    
    for i = 1:n
    
        for j = min(jobs(i).deadline, n):-1:1
            if scheduledJobs(j) == -1 then
                // Schedule job in this slot
                scheduledJobs(j) = jobs(i).id;
                totalProfit = totalProfit + jobs(i).profit;
                break;
            end
        end
    end
    
    
    disp("Job sequence for maximum profit:");
    disp(scheduledJobs);
    disp("Total profit:");
    disp(totalProfit);
endfunction


jobs = [
    createJobStruct(1, 2, 100),
    createJobStruct(2, 1, 19),
    createJobStruct(3, 2, 27),
    createJobStruct(4, 1, 25),
    createJobStruct(5, 3, 15)
];

n = length(jobs); // Number of jobs

jobSequence(jobs, n);