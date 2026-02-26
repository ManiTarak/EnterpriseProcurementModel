module.exports = cds.service.impl(async function(){
    const {EmployeeSet} = this.entities;

    this.before(['UPDATE','CREATE'],EmployeeSet,(req,res)=>{
             const data= req.data;
             if(data.hasOwnProperty("salaryAmount")){
                const salary =req.data.salaryAmount;
                if(salary>10000000){
                    req.error(500,"Brother check salary must me less than 10000000")
                }
             }
    });

    this.after('READ',EmployeeSet,(req,res)=>{
          res.results.map((i)=>{i.salaryAmount=i.salaryAmount+i.salaryAmount*10/100})
    });

})