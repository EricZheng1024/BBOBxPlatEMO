classdef BBOB < PROBLEM
% <multi> <real> <large/none> <expensive/none>
% bbob-biobj
% index_fun --- 1 --- from 1 to 55
% index_ins --- 1 --- from 1 to 15

% References: "COCO: A Platform for Comparing Continuous Optimizers in a
% Black-Box Setting" and "Using Well-Understood Single-Objective Functions
% in Multiobjective Black-Box Optimization Test Suites"
% Implemented on PlatEMO by: Ruihao Zheng

    properties(Access = private)
        index_fun;
        index_ins;
        problem;
    end
    methods
        %% Default settings of the problem
        function Setting(obj)
            [obj.index_fun, obj.index_ins] = obj.ParameterSet(1, 1);
            if obj.index_fun > 55 || obj.index_fun < 1
                error('Out of range (index_fun).')
            end
            if obj.index_ins > 15 || obj.index_ins < 1
                error('Out of range (index_ins).')
            end
            D_predef = [2,3,5,10,20,40];
            if isempty(obj.D)
                obj.D = D_predef(4);
            end
            if ~ismember(obj.D,D_predef)
                [~,I] = min(abs(obj.D-D_predef));
                obj.D = D_predef(I);
                warning(['The dimension of variables is set to ' num2str(obj.D) '.'])
            end

            index = (find(obj.D==D_predef,1)-1)*55*15 + (obj.index_fun-1) * 15 + (obj.index_ins - 1);

            suite = cocoSuite('bbob-biobj', '', '');
            obj.problem = cocoSuiteGetProblem(suite, index);
            obj.M = 2;
            % obj.D = cocoProblemGetDimension(obj.problem);
            obj.lower = cocoProblemGetSmallestValuesOfInterest(obj.problem);
            obj.upper = cocoProblemGetLargestValuesOfInterest(obj.problem);
            obj.encoding = 'real';
            % cocoProblemFree(obj.problem);  % 会导致计算目标函数值时matlab崩溃，然而不释放可能导致随着运行内存不断增加 
            % cocoSuiteFree(suite);
        end
        %% Calculate objective values
        function PopObj = CalObj(obj,PopDec)
            PopObj = zeros(size(PopDec,1),obj.M);
            for i = 1 : size(PopDec,1)
                PopObj(i,:) = cocoEvaluateFunction(obj.problem,PopDec(i,:));
            end
        end
        %% Generate points on the Pareto front
        function R = GetOptimum(obj,N)
            R = [];
        end
        %% Generate the image of Pareto front
        function R = GetPF(obj)
            R = [];
        end
    end
end