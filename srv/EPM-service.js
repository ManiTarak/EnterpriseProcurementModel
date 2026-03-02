module.exports = cds.service.impl(async function(){
    const {EmployeeSet,POEntitySet} = this.entities;

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

     
    this.on("getMostExpensiveOrder",async(req,res)=>{
        try{
            const tx = cds.tx(req);
            const myData = await tx.read(POEntitySet).orderBy({
                "GROSS_Amount":'desc'
            }).limit(1);
            return myData;
        }catch(error){
          return "Hey Amigo"+error.toString();
        }
    })

    this.on("increaseSalary",async (req,res)=>{
         try{
          req.user.is('Editor')||req.reject(403)
           const POID = req.params[0];
           const tx = cds.tx(req);
           await tx.update(POEntitySet).with({
                "GROSS_Amount":{'+=':20000}
           }).where(POID);
           const updatedrecord = await tx.read(POEntitySet).where(POID);
           return updatedrecord;
         }catch(error){
           return "Hey Amigo"+error;
         }
    });
})